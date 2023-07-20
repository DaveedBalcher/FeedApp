//
//  UITableView+Dequeueing.swift
//  FeedAppiOS
//
//  Created by Daveed Balcher on 5/9/23.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
