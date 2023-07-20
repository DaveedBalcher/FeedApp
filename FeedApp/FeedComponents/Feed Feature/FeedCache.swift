//
//  FeedCache.swift
//  FeedComponents
//
//  Created by Daveed Balcher on 7/7/23.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>

    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
