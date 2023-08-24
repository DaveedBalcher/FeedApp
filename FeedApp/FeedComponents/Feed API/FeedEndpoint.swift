//
//  FeedEndpoint.swift
//  FeedComponents
//
//  Created by Daveed Balcher on 8/24/23.
//

import Foundation

public enum FeedEndpoint {
    case get

    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            return baseURL.appendingPathComponent("/v1/feed")
        }
    }
}
