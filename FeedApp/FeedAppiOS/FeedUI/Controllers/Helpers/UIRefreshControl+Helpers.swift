//
//  UIRefreshControl+Helpers.swift
//  FeedAppiOS
//
//  Created by Daveed Balcher on 6/12/23.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
