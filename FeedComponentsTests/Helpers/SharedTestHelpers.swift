//
//  SharedTestHelpers.swift
//  FeedAppTests
//
//  Created by Daveed Balcher on 2/16/23.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}
