//
//  SearchBarViewModel.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 18.07.2024.
//

import Foundation

class SearchBarViewModel: ObservableObject {
    @Published var homeInstanse = HomeViewModel()
    @Published var imageOverlayInstanse = ImageOverlayViewModel()
    @Published var searchText: String = ""
    
    var filteredImages: [(Int, ImageModel)] {
        homeInstanse.dataArray.enumerated().compactMap { index, image -> (Int, ImageModel)? in
            guard let imageName = image.slug,
                  checkSubstring(in: imageName, for: searchText),
                  let _ = image.urls?.regular else {
                return nil
            }
            return (index, image)
        }
    }
    
    private func checkSubstring(in text: String, for substring: String) -> Bool {
        return text.range(of: substring, options: .caseInsensitive) != nil
    }
}


