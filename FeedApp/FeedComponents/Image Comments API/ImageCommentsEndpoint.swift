//
//  ImageCommentsEndpoint.swift
//  FeedComponents
//
//  Created by Daveed Balcher on 8/24/23.
//

import Foundation

public enum ImageCommentsEndpoint {
    case get(UUID)

    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(id):
            return baseURL.appendingPathComponent("/v1/image/\(id)/comments")
        }
    }
}
