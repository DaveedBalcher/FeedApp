//
//  RemoteFeedLoader.swift
//  FeedApp
//
//  Created by Daveed Balcher on 8/2/22.
//

import Foundation

public typealias RemoteFeedLoader = RemoteLoader<[FeedImage]>

public extension RemoteFeedLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: FeedItemsMapper.map)
    }
}
