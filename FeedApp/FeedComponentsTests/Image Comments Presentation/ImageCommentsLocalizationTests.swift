//
//  ImageCommentsLocalizationTests.swift
//  FeedComponentsTests
//
//  Created by Daveed Balcher on 8/15/23.
//

import XCTest
import FeedComponents

class ImageCommentsLocalizationTests: XCTestCase {

    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "ImageComments"
        let bundle = Bundle(for: ImageCommentsPresenter.self)

        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }

}
