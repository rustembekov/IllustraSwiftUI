//
//  TabBarViewModel.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 14.07.2024.
//

import Foundation
import SwiftUI

class TabBarViewModel: ObservableObject {
    @Published var selectedTab: Tab = .home
    
    func contentForSelectedTab() -> some View {
        Group {
            switch selectedTab {
            case .home:
                HomeView()
            case .search:
                SearchBarView()
            case .add:
                AddContentView()
            case .chat:
                ChatView()
            case .profile:
                ProfileView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

enum Tab: String {
    case home, search, add, chat, profile
}
