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
    
    private func getImagePath(imageName: String) -> URL? {
        guard let folderPath = getFolderPath() else {
            return nil
        }
        return folderPath.appendingPathComponent(imageName + ".png")
    }
    
    func addImage(imageName: String, image: UIImage) {
        guard
            let data = image.pngData(),
            let url = getImagePath(imageName: imageName)
        else { return print("Error converting data")}
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving data! \(error)")
        }
    }
    
    func getImage(imageName: String) -> UIImage? {
        guard
            let imageName = getImagePath(imageName: imageName),
            FileManager.default.fileExists(atPath: imageName.path)
        else { return nil}
        
        return UIImage(contentsOfFile: imageName.path)
    }
    
}
