//
//  CacheFeedUseCaseTests.swift
//  FeedAppTests
//
//  Created by Daveed Balcher on 1/25/23.
//

import XCTest
import FeedComponents

final class CacheFeedUseCaseTests: XCTestCase {

    func test_init_doesNotMessageTheStoreUponCreation() {
        let (_, store) = makeSUT()
        
        XCTAssertEqual(store.receivedMessages, [])
    }

    func test_save_requestCacheDeletion() {
        let (sut, store) = makeSUT()
        let feedImages = uniqueImageFeed().models
        
        sut.save(feedImages) { _ in }
        
        XCTAssertEqual(store.receivedMessages, [.deleteCachedFeed])
    }
    
    func test_save_doesNotRequestCacheInsertionOnDeletionError() {
        let (sut, store) = makeSUT()
        let feedImages = uniqueImageFeed().models
        let deletionError = anyNSError()
        
        sut.save(feedImages) { _ in }
        store.completeDeletion(with: deletionError)
        
        XCTAssertEqual(store.receivedMessages, [.deleteCachedFeed])
    }
    
    func test_save_requestsCacheInsertionWithTimestampOnSuccessfulDeletion() {
        let timestamp = Date()
        let (sut, store) = makeSUT(currentDate: { timestamp })
        let (feedImages, localFeedImages) = uniqueImageFeed()
        
        sut.save(feedImages) { _ in }
        store.completeDeletionSuccessfully()
        
        XCTAssertEqual(store.receivedMessages, [.deleteCachedFeed, .insert(localFeedImages, timestamp)])
    }
    
    func test_save_failsOnDeletionError() {
        let (sut, store) = makeSUT()
        let deletionError = anyNSError()

        expect(sut, toCompleteWithError: deletionError) {
            store.completeDeletion(with: deletionError)
        }
    }
    
    func test_save_failsOnInsertionError() {
        let (sut, store) = makeSUT()
        let insertionError = anyNSError()

        expect(sut, toCompleteWithError: insertionError) {
            store.completeDeletionSuccessfully()
            store.completeInsertion(with: insertionError)
        }
    }
    
    func test_save_succeedsOnSuccessfulCacheInsertion() {
        let (sut, store) = makeSUT()
        
        expect(sut, toCompleteWithError: nil) {
            store.completeDeletionSuccessfully()
            store.completeInsertionSuccessfully()
        }
    }
    
    func test_save_doesNotDeleiverDeletionErrorAfterSUTHasBeenDeallocated() {
        let store = FeedStoreSpy()
        var sut: LocalFeedLoader? = LocalFeedLoader(store: store, currentDate: Date.init)
        
        var recievedResults = [Error?]()
        sut?.save([uniqueFeedImage()]) { recievedResults.append($0 as? Error) }
        
        sut = nil
        store.completeDeletion(with: anyNSError())
        
        XCTAssertTrue(recievedResults.isEmpty)
    }
    
    func test_save_doesNotDeleiverInsertionErrorAfterSUTHasBeenDeallocated() {
        let store = FeedStoreSpy()
        var sut: LocalFeedLoader? = LocalFeedLoader(store: store, currentDate: Date.init)
        
        var receivedResults = [Error?]()
        sut?.save([uniqueFeedImage()]) { receivedResults.append($0 as? Error) }
        
        store.completeDeletionSuccessfully()
        sut = nil
        store.completeInsertion(with: anyNSError())
        
        XCTAssertTrue(receivedResults.isEmpty)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #file, line: UInt = #line) -> (sut: LocalFeedLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store, currentDate: currentDate)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, store)
    }
    
    private func expect(_ sut: LocalFeedLoader, toCompleteWithError expectedError: NSError?, when action: () -> Void, file: StaticString = #file, line: UInt = #line) {
        let feedImages = uniqueImageFeed().models
        let ex = expectation(description: "Wait for save completion")
        
        var receivedError: Error?
        sut.save(feedImages) { result in
            if case let Result.failure(error) = result { receivedError = error }
            ex.fulfill()
        }
        action()
        wait(for: [ex], timeout: 1.0)
        
        XCTAssertEqual(receivedError as NSError?, expectedError, file: file, line: line)
    }
}