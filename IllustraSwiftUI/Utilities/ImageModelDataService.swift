//
//  ImageModelDataService.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 14.07.2024.
//

import Foundation
import Combine

class ImageModelDataService {
    static let instanse = ImageModelDataService()
    @Published var imageModel: [ImageModel] = []
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init() {
        fetchImages()
    }
    
    func fetchImages() {
        let accessKey = "CWhojOGwBYqdjvIPU7mWXUKE5_ORPMX18UEs7C9vkTc"
        let urlString = "https://api.unsplash.com/photos/?client_id=\(accessKey)"
        
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [ImageModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error downloading data. \(error)")
                }
            } receiveValue: { [weak self] returnedImages in
                print("Successfully downloaded")
                self?.imageModel = returnedImages
                
            }
            .store(in: &cancellables)
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
