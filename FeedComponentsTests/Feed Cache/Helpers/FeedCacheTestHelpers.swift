//
//  FeedCacheTestHelpers.swift
//  FeedAppTests
//
//  Created by Daveed Balcher on 2/16/23.
//

import Foundation
import FeedComponents

func uniqueFeedImage() -> FeedImage {
    FeedImage(id: UUID(),
             description: "any",
             location: "any",
             url: anyURL())
}

func uniqueImageFeed() -> (models: [FeedImage], local: [LocalFeedImage]) {
    let feedImages = [uniqueFeedImage(), uniqueFeedImage()]
    let localFeedImages = feedImages.map { LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url)}
    return (feedImages, localFeedImages)
}

extension Date {
    func minusFeedCacheMaxAge() -> Date {
        return adding(days: -feedCacheMaxAgeInDays)
    }

    private var feedCacheMaxAgeInDays: Int {
        return 7
    }
    
    private func adding(days: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .day, value: days, to: self)!
    }
}

extension Date {
    func adding(seconds: TimeInterval) -> Date {
        return self + seconds
    }
}