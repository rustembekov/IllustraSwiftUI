//
//  ImageView.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 15.07.2024.
//

import SwiftUI

struct ImageView: View {
    @StateObject var imageLoader: ImageLoaderViewModel
    @Binding var selectedImage: UIImage?
    @Binding var showImageOverlay: Bool
    
    init(urlString: String, imageName: String, selectedImage: Binding<UIImage?>, showImageOverlay: Binding<Bool>) {
        _imageLoader = StateObject(wrappedValue: ImageLoaderViewModel(urlString: urlString, imageName: imageName))
        _selectedImage = selectedImage
        _showImageOverlay = showImageOverlay
    }
    
    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.3)
                .clipped()
                .onTapGesture {
                    selectedImage = image
                    showImageOverlay = true
                }
        } else {
            ProgressView()
        }
    }
}



//struct ImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageView(urlString: <#String#>, imageName: <#String#>, selectedImage: <#Binding<UIImage?>#>, showImageOverlay: <#Binding<Bool>#>)
//    }
//}
