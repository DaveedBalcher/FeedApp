//
//  UIButton+TestHelpers.swift
//  FeedAppiOSTests
//
//  Created by Daveed Balcher on 4/27/23.
//

import UIKit

private extension UIButton {
    func simulateTap() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .touchUpInside)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
