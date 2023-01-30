//
//  LoadFeedFromCacheUseCaseTests.swift
//  FeedAppTests
//
//  Created by Daveed Balcher on 1/30/23.
//

import XCTest
import FeedApp

final class LoadFeedFromCacheUseCaseTests: XCTestCase {
    
    func test_init_doesNotMessageTheStoreUponCreation() {
        let (_, store) = makeSUT()
        
        XCTAssertEqual(store.recievedMessages, [])
    }
    
    // MARK: - Helpers
    
    private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #file, line: UInt = #line) -> (sut: LocalFeedLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store, currentDate: currentDate)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, store)
    }
    
    private class FeedStoreSpy: FeedStore {
        enum RecievedMessages: Equatable {
            case deleteCacheFeed
            case insert([LocalFeedImage], Date)
        }
        
        private(set) var recievedMessages = [RecievedMessages]()
        
        private var deletionCompletions = [DeletionCompletion]()
        private var insertionCompletions = [InsertionCompletion]()
        
        func deleteCachedFeed(completion: @escaping DeletionCompletion) {
            deletionCompletions.append(completion)
            recievedMessages.append(.deleteCacheFeed)
        }
        
        func completeDeletion(with error: Error, at index: Int = 0) {
            deletionCompletions[index](error)
        }
        
        func completeDeletionSuccessfully(at index: Int = 0) {
            deletionCompletions[index](nil)
        }
        
        func insert(_ feedImages: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
            insertionCompletions.append(completion)
            recievedMessages.append(.insert(feedImages, timestamp))
        }
        
        func completeInsertion(with error: Error, at index: Int = 0) {
            insertionCompletions[index](error)
        }
        
        func completeInsertionSuccessfully(at index: Int = 0) {
            insertionCompletions[index](nil)
        }
    }
    
    private func uniqueFeedImage() -> FeedImage {
        FeedImage(id: UUID(),
                  description: "any",
                  location: "any",
                  url: anyURL())
    }
    
    private func uniqueFeedImages() -> (models: [FeedImage], local: [LocalFeedImage]) {
        let feedImages = [uniqueFeedImage(), uniqueFeedImage()]
        let localFeedImages = feedImages.map { LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url)}
        return (feedImages, localFeedImages)
    }
    
    private func anyURL() -> URL {
        return URL(string: "http://any-url.com")!
    }
    
    private func anyNSError() -> NSError {
        return NSError(domain: "any error", code: 0)
    }
}
