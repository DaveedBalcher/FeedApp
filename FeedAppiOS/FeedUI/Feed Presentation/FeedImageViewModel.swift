//
//  FeedImageViewModel.swift
//  FeedAppiOS
//
//  Created by Daveed Balcher on 5/1/23.
//

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
