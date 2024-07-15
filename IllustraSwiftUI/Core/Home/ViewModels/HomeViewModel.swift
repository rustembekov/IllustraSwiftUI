//
//  HomeViewModel.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 14.07.2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var dataArray: [ImageModel] = []
    let dataService = ImageModelDataService.instanse
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.$imageModel
            .sink { [weak self] (returnedImages) in
                self?.dataArray = returnedImages
            }
            .store(in: &cancellables)
    }
}
