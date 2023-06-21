//
//  FeedImageDataStore.swift
//  FeedComponents
//
//  Created by Daveed Balcher on 6/21/23.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>

    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
