//
//  ImageOverlayView.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 16.07.2024.
//

import SwiftUI

struct ImageOverlayView: View {
    var image: UIImage
    @Binding var showOverlay: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.black.edgesIgnoringSafeArea(.all)
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    showOverlay = false
                }
            
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        showOverlay = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                    .padding()
                    Spacer()
                }
            }
        }
    }
}


//struct ImageOverlayView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageOverlayView(image: UIImage(systemName: "") ?? "", showOverlay: false)
//    }
//}
