//
//  FeedLoader.swift
//  FeedApp
//
//  Created by Daveed Balcher on 7/27/22.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
