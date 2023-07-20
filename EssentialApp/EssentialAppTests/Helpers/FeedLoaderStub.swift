//
//  FeedLoaderStub.swift
//  EssentialAppTests
//
//  Created by Daveed Balcher on 7/7/23.
//

import FeedComponents

class FeedLoaderStub: FeedLoader {
    private let result: FeedLoader.Result

    init(result: FeedLoader.Result) {
        self.result = result
    }

    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
