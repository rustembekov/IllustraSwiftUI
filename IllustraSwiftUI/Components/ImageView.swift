//
//  ImageView.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 15.07.2024.
//

import SwiftUI

struct ImageView: View {
    @StateObject var imageLoader: ImageLoaderViewModel
    
    init(urlString: String, imageName: String) {
        _imageLoader = StateObject(wrappedValue: ImageLoaderViewModel(urlString: urlString, imageName: imageName))
    }
    
    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.3)
                .clipped()
        }
        else {
            ProgressView()
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(urlString: "", imageName: "")
    }
}
