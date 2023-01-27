//
//  RemoteFeedItem.swift
//  FeedApp
//
//  Created by Daveed Balcher on 1/27/23.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
