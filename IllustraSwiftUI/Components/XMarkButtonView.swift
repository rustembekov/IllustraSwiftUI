//
//  XMarkButtonView.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 17.07.2024.
//

import SwiftUI

struct XMarkButtonView: View {
    @Binding var showOverlay: Bool

    var body: some View {
        Button {
            showOverlay = false
        } label: {
            Image(systemName: "xmark")
                .foregroundColor(.white)
                .font(.headline)
        }
    }
}

struct XMarkButtonView_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButtonView(showOverlay: .constant(true))
    }
}
