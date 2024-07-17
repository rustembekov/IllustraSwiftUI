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
        
        ZStack {
            sectionImage
                .scaledToFill()
                .blur(radius: 40)
                .ignoresSafeArea()
            
            VStack {
                sectionProfile
                
                Spacer()
                
                sectionImage
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.7)
                
                Spacer()
            }
        }
    }
}

struct ImageOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        ImageOverlayView(image: UIImage(named: "testing")!, showOverlay: .constant(true))
    }
}

extension ImageOverlayView {
    private var sectionProfile: some View {
        HStack {
            HStack {
                Image("profile")
                    .resizable()
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading) {
                    Text("ImranSid")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("@imransiddique")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            Spacer()
            XMarkButtonView(showOverlay: $showOverlay)
        }
        .padding(.horizontal)
        .frame(maxWidth: UIScreen.main.bounds.width - 40)
        
    }
    
    private var sectionImage: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
