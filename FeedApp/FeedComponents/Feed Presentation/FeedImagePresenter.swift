//
//  FeedImagePresenter.swift
//  FeedComponents
//
//  Created by Daveed Balcher on 6/19/23.
//

import Foundation

public final class FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
}
