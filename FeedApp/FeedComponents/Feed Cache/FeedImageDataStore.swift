//
//  FeedImageDataStore.swift
//  FeedComponents
//
//  Created by Daveed Balcher on 6/21/23.
//

import Foundation

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
