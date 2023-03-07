//
//  FeedLoader.swift
//  FeedApp
//
//  Created by Daveed Balcher on 7/27/22.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
