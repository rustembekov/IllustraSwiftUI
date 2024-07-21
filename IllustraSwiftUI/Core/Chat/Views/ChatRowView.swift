//
//  ChatRowView.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 18.07.2024.
//

import SwiftUI

struct ChatRowView: View {
    var body: some View {
        HStack(alignment: .bottom) {
            Image("profile")
                .resizable()
                .frame(width: 64, height: 64)
            VStack(alignment: .leading, spacing: 8) {
                Text("James")
                    .font(.headline)
                Text("Thank you! That was very helpful!")
                    .font(.subheadline)
                    .lineLimit(1)
            }
            .padding()
        }
    }
}

struct ChatRowView_Previews: PreviewProvider {
    static var previews: some View {
        ChatRowView()
    }
}
