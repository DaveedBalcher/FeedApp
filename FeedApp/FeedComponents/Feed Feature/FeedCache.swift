//
//  FeedCache.swift
//  FeedComponents
//
//  Created by Daveed Balcher on 7/7/23.
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
