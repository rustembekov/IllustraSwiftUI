//
//  ImageModel.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 14.07.2024.
//

import Foundation

struct ImageModel: Identifiable, Codable {
    let id, slug: String?
    let urls: Urls?
}

struct Urls: Codable {
    let raw, full, regular, small: String?
}
