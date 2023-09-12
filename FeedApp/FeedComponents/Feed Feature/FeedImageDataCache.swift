//
//  FeedImageDataCache.swift
//  FeedComponents
//
//  Created by Daveed Balcher on 7/7/23.
//

import Foundation

public protocol FeedImageDataCache {
    func save(_ data: Data, for url: URL) throws
}
