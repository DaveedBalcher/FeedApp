//
//  FeedStore.swift
//  FeedApp
//
//  Created by Daveed Balcher on 1/27/23.
//

import Foundation

public protocol FeedStore {
    typealias DeletionCompletion = (Error?)->Void
    typealias InsertionCompletion = (Error?)->Void
    typealias RetrievalCompletion = (Error?)->Void

    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ feedImages: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion)
    func retrieve(completion: @escaping RetrievalCompletion)
}
