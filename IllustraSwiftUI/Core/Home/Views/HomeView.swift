import SwiftUI

struct HomeView: View {
    @StateObject private var vm = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    discoverText
                    HomeCarouselView()
                    HomeBrowseView()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    private var discoverText: some View {
        VStack() {
            Text("What's New Today")
                .textCase(.uppercase)
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(30)

            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Discover")
                    .font(.system(size: 40, weight: .light))
                    .padding()
            }
        }
    }
}
