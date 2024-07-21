//
//  ChatBoxView.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 18.07.2024.
//

import SwiftUI

struct ChatBoxView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<4) { message in
                    VStack {
                        HStack(alignment: .top) {
                            Image("profile")
                                .resizable()
                                .frame(width: 28, height: 28)
                            Text("Tes dfk dfkdkf dfkfkd kdf")
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                                .padding(.vertical, 4)
                        }
                        HStack(alignment: .top) {
                            Text("Tes dfk dfkdkf dfkfkd kd sdsd s sds s s sdsds ds f")
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                                .padding(.vertical, 4)
                            Image("profile")
                                .resizable()
                                .frame(width: 28, height: 28)
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationBarTitle("James", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct ChatBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBoxView()
    }
}
