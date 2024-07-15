//
//  ImageLoaderViewModel.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 15.07.2024.
//

import Foundation
import Combine
import SwiftUI

class ImageLoaderViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    let manager = ImageLocalManager.instanse
    
    init(urlString: String) {
        self.image = manager.getImage(imagePath: urlString)
    }
    
    func loadImage(from urlString: String) {
        print("Downloading image now!")
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                print("Completion: \(completion)")
            }, receiveValue: { [weak self] (returnedImage) in
                guard
                    let self = self,
                    let image = returnedImage else { return }
                self.manager.addImage(imagePath: urlString, image: image)
            })
            .store(in: &cancellables)
    }
}
