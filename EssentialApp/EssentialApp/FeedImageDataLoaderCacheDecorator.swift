//
//  FeedImageDataLoaderCacheDecorator.swift
//  EssentialApp
//
//  Created by Daveed Balcher on 7/7/23.
//

import Foundation
import FeedComponents

public class FeedImageDataLoaderCacheDecorator: FeedImageDataLoader {
    private let decoratee: FeedImageDataLoader
    private let cache: FeedImageDataCache

    public init(decoratee: FeedImageDataLoader, cache: FeedImageDataCache) {
        self.decoratee = decoratee
        self.cache = cache
    }
    
    public func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
        return decoratee.loadImageData(from: url) { [weak self] result in
            completion(result.map({ data in
                self?.cache.save(data, for: url) { _ in }
                return data
            }))
        }
    }
}
