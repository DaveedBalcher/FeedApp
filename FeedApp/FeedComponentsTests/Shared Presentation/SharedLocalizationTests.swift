//
//  SharedLocalizationTests.swift
//  FeedComponentsTests
//
//  Created by Daveed Balcher on 7/28/23.
//

import XCTest
import FeedComponents

class SharedLocalizationTests: XCTestCase {
    
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Shared"
        let bundle = Bundle(for: LoadResourcePresenter<Any, DummyView>.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
    
    private class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }
    
}
