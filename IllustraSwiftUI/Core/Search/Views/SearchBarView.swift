//
//  SearchBarView.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 13.07.2024.
//

import SwiftUI

struct SearchBarView: View {
    @State var searchText: String = ""
    @StateObject private var vm = SearchBarViewModel()
    @State var selectedImage: UIImage? = nil
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    

    var body: some View {
        VStack(alignment: .leading) {
            Text("Search")
                .font(.largeTitle)
                .padding()
            SearchTextFieldView(searchText: $vm.searchText)
            VStack {
                Text("ALL RESULTS")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                
            }
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(Array(vm.filteredImages.enumerated()), id: \.element.1.id) { index, imageTuple in
                        let (_, image) = imageTuple
                        if let imageName = image.slug,
                           let imageURL = image.urls?.regular {
                            ImageView(urlString: imageURL, imageName: imageName, selectedImage: $selectedImage, showImageOverlay: vm.imageOverlayInstanse.delayedShowImageOverlay)
                                .padding(.top, index % 2 != 0 ? 30 : 0)
                        } else {
                            Color.clear
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 80)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
