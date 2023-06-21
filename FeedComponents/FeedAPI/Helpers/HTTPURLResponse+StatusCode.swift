//
//  HTTPURLResponse+StatusCode.swift
//  FeedComponents
//
//  Created by Daveed Balcher on 6/21/23.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }

    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
