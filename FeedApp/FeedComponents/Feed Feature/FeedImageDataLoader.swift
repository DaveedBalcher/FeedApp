//
//  FeedImageDataLoader.swift
//  FeedAppiOS
//
//  Created by Daveed Balcher on 4/27/23.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
