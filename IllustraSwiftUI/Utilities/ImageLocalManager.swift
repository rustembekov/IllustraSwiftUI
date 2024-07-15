//
//  ImageLocalManager.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 15.07.2024.
//

import Foundation
import SwiftUI

class ImageLocalManager {
    static let instanse = ImageLocalManager()
    private let folderName = "downloaded_images"
    
    private init() {
        createFolderIfNeeded()
    }
    
    private func createFolderIfNeeded() {
        guard let url = getFolderPath() else { return }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
                print("Created folder!")
            } catch let error {
                print("Creating directory error! \(error)")
            }
        }
    }
    
    private func getFolderPath() -> URL? {
        return FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
    }
    
    private func getImagePath(imagePath: String) -> URL? {
        guard let folderPath = getFolderPath() else { return nil }
        return folderPath.appendingPathComponent(imagePath + ".png")
    }
    
    func addImage(imagePath: String, image: UIImage) {
        guard
            let data = image.pngData(),
            let url = getImagePath(imagePath: imagePath)
        else { return print("Error converting data")}
        
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving data! \(error)")
        }
    }
    
    func getImage(imagePath: String) -> UIImage? {
        guard
            let url = getImagePath(imagePath: imagePath),
            FileManager.default.fileExists(atPath: url.path)
        else { return nil}
        
        return UIImage(contentsOfFile: url.path)
    }
    
}
