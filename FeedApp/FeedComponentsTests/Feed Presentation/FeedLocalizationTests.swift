//
//  FeedLocalizationTests.swift
//  FeedAppiOSTests
//
//  Created by Daveed Balcher on 6/7/23.
//

import XCTest
import FeedComponents

final class FeedLocalizationTests: XCTestCase {
    
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Feed"
        let bundle = Bundle(for: FeedPresenter.self)

        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
    
}
