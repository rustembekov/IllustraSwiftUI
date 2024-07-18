//
//  ImageOverlayViewModel.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 17.07.2024.
//

import SwiftUI

class ImageOverlayViewModel: ObservableObject {
    @Published var showImageOverlay: Bool = false

    var delayedShowImageOverlay: Binding<Bool> {
        Binding(
            get: { self.showImageOverlay },
            set: { newValue in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.showImageOverlay = newValue
                }
            }
        )
    }
}
