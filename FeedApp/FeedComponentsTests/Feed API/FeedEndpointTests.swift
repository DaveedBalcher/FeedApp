//
//  FeedEndpointTests.swift
//  FeedComponentsTests
//
//  Created by Daveed Balcher on 8/24/23.
//

import XCTest
import FeedComponents

class FeedEndpointTests: XCTestCase {

    func test_feed_endpointURL() {
        let baseURL = URL(string: "http://base-url.com")!

        let received = FeedEndpoint.get.url(baseURL: baseURL)
        let expected = URL(string: "http://base-url.com/v1/feed")!

        XCTAssertEqual(received, expected)
    }

}
