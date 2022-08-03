//
//  RemoteFeedLoader.swift
//  FeedApp
//
//  Created by Daveed Balcher on 8/2/22.
//

import Foundation


public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case error(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}


public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping (Error) -> Void) {
        client.get(from: url) { result in
            switch result {
            case .success(_,_):
                completion(.invalidData)
            case .error(_):
                completion(.connectivity)
            }
        }
    }
}
