//
//  ChatView.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 13.07.2024.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<4) { index in
                    NavigationLink(destination: ChatBoxView()) {
                        ChatRowView()
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Chats")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                }
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
