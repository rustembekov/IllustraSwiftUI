//
//  SearchTextFieldView.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 18.07.2024.
//

import SwiftUI

struct SearchTextFieldView: View {
    @Binding var searchText: String
    var body: some View {
        HStack(){
            Image(systemName: "magnifyingglass")
                .foregroundColor(searchText.isEmpty ? .gray : .blue)
            TextField("Search by name or symbol...", text: $searchText)
                .foregroundColor(.gray)

                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            searchText = ""
                        }
                    ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black, lineWidth: 1)
        )
        .padding()
    }}

struct SearchTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextFieldView(searchText: .constant(""))
    }
}
