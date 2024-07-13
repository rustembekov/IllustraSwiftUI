import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0

    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                VStack {
                    Text("Tab 1")
                    Text(Image(systemName: "star"))
                }
                .tabItem {
                    selectedTab == 0 ? Image(systemName: "star") : Image(systemName: "sun.max")
                    Text("First")
                }
                .tag(0)
                
                VStack {
                    Text("Tab 2")
                    Text(Image(systemName: "moon.stars"))
                    
                }
                .tabItem {
                    selectedTab == 1 ? Image(systemName: "moon.stars") : Image(systemName: "sun.max")
                    
                
                    
                    Text("Second")
                }
                .tag(1)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
