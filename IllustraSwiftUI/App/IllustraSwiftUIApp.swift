//
//  IllustraSwiftUIApp.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 13.07.2024.
//

import SwiftUI

@main
struct IllustraSwiftUIApp: App {

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(TabBarViewModel())
        }
    }
}
