//
//  LocalFeedLoader.swift
//  FeedApp
//
//  Created by Daveed Balcher on 1/27/23.
//

import Foundation

public class LocalFeedLoader {
    private let store: FeedStore
    private let currentDate: () -> Date
    
    public typealias SaveResult = Error?
    
    public init(store: FeedStore, currentDate: @escaping () -> Date) {
        self.store = store
        self.currentDate = currentDate
    }
    
    public func save(_ feedImages: [FeedImage], completion: @escaping (Error?) -> Void) {
        store.deleteCachedFeed { [weak self] error in
            guard let self = self else { return }
            
            if let cacheDeletionError = error {
                completion(cacheDeletionError)
            } else {
                self.cache(feedImages, with: completion)
            }
        }
    }
    
    public func cache(_ feedImages: [FeedImage], with completion: @escaping (SaveResult) -> Void) {
        store.insert(feedImages.toLocal(), timestamp: currentDate()) { [weak self] error in
            guard self != nil else { return }
            completion(error)
        }
    }
}

private extension Array where Element == FeedImage {
    func toLocal() -> [LocalFeedImage] {
        return map { feedImages in
            LocalFeedImage(id: feedImages.id,
                          description: feedImages.description,
                          location: feedImages.location,
                          url: feedImages.url)
        }
    }
}
