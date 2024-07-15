//
//  HomeBrowseView.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 14.07.2024.
//

import SwiftUI

struct HomeBrowseView: View {
    @StateObject private var vm = HomeViewModel()

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("BROWSE ALL")
                .font(.headline)
                .fontWeight(.bold)
                .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(Array(vm.dataArray.enumerated()), id: \.element.id) { index, image in
                        if let imageURL = image.urls?.regular {
                            ImageView(urlString: imageURL)
                                .padding(.top, index % 2 != 0 ? 30 : 0)
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

struct HomeBrowseView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBrowseView()
    }
}
