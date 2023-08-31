//
//  FeedImagePresenterTests.swift
//  FeedComponentsTests
//
//  Created by Daveed Balcher on 6/19/23.
//

import XCTest
import FeedComponents

class FeedImagePresenterTests: XCTestCase {
    
    func test_map_createsViewModel() {
        let image = uniqueImage()
        
        let viewModel = FeedImagePresenter.map(image)
        
        XCTAssertEqual(viewModel.description, image.description)
        XCTAssertEqual(viewModel.location, image.location)
    }
}
