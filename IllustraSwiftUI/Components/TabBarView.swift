//
//  TabBarView.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 13.07.2024.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var tabViewModel: TabBarViewModel

    var body: some View {
        ZStack(alignment: .bottom) {
            tabViewModel.contentForSelectedTab()
            tabBar
                .padding()
                .background(Color.white)
                .shadow(radius: 5)
        }

        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView().environmentObject(TabBarViewModel())
    }
}

extension TabBarView {
    private var tabBar: some View {
        HStack(spacing: 15) {
            tabBarButton(tab: .home, image: "house")
            tabBarButton(tab: .search, image: "magnifyingglass")
            addButtonView
            tabBarButton(tab: .chat, image: "message")
            tabBarButton(tab: .profile, image: "person")
        }
    }
    
    private func tabBarButton(tab: Tab, image: String) -> some View {
        Button(action: {
            tabViewModel.selectedTab = tab
        }) {
            Image(systemName: image)
                .font(.system(size: 25))
                .environment(\.symbolVariants, .none)
        }
        .foregroundColor(tabViewModel.selectedTab == tab ? .blue : Color.black.opacity(0.6))
        .padding()
    }
    
    private var addButtonView: some View {
        Button(action: {
            tabViewModel.selectedTab = .add
        }) {
            AddButtonView()
        }
    }
}
