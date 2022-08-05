//
//  HTTPClient.swift
//  FeedApp
//
//  Created by Daveed Balcher on 8/5/22.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case error(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
