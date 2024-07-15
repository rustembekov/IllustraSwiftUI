//
//  HomePanoramaView.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 14.07.2024.
//

import SwiftUI

struct HomeCarouselView: View {
    var body: some View {
        VStack {
            TabView {
                ForEach(0..<3) { index in
                    VStack(alignment: .leading) {
                        imageSection
                        profileSection
                            .padding(.horizontal)
                    }
                    .padding(.horizontal, 10)
                    .background(Color.white)
                    .cornerRadius(10)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 390)
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            Spacer()
        }
    }
}

struct HomeCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCarouselView()
    }
}

extension HomeCarouselView {
    private var imageSection: some View {
        Image("testing")
            .resizable()
            .scaledToFill()
            .frame(width: 343, height: 343)
            .clipped()
            .padding(.horizontal)
    }
    
    private var profileSection: some View {
        HStack {
            Image("profile")
                .resizable()
                .scaledToFill()
                .frame(width: 28, height: 28)
                .cornerRadius(14)
                .clipped()
            
            VStack(alignment: .leading) {
                Text("BhaskerNaraayan")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("@narayan1")
                    .font(.subheadline)
                    .fontWeight(.regular)
            }
        }
    }
}
