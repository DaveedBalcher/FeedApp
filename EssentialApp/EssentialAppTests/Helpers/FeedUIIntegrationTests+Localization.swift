//
//  FeedUIIntegrationTests+Localization.swift
//  FeedAppiOS
//
//  Created by Daveed Balcher on 5/25/23.
//

import Foundation
import XCTest
import FeedComponents

extension FeedUIIntegrationTests {
    private class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }
    
    var loadError: String {
        LoadResourcePresenter<Any, DummyView>.loadError
    }
    
    var feedTitle: String {
        FeedPresenter.title
    }
    
    var commentsTitle: String {
        ImageCommentsPresenter.title
    }
}
