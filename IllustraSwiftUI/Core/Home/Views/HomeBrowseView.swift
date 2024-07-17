import SwiftUI

struct HomeBrowseView: View {
    @StateObject private var vm = HomeViewModel()
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    @State private var selectedImage: UIImage? = nil
    @State private var showImageOverlay: Bool = false
    
    private var delayedShowImageOverlay: Binding<Bool> {
        Binding(
            get: { self.showImageOverlay },
            set: { newValue in

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.showImageOverlay = newValue
                }
            }
        )
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("BROWSE ALL")
                .font(.headline)
                .fontWeight(.bold)
                .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(Array(vm.dataArray.enumerated()), id: \.element.id) { index, image in
                        if let imageURL = image.urls?.regular, let imageName = image.slug {
                            ImageView(urlString: imageURL, imageName: imageName, selectedImage: $selectedImage, showImageOverlay: self.delayedShowImageOverlay)
                                .padding(.top, index % 2 != 0 ? 30 : 0)
                        } else {
                            Color.clear
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 80)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .fullScreenCover(isPresented: $showImageOverlay) {
            if let selectedImage = selectedImage {
                ImageOverlayView(image: selectedImage, showOverlay: $showImageOverlay)
            } else {
                Text("No image selected \(showImageOverlay.description)")
                    .font(.title)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        showImageOverlay = false
                    }
            }
        }
    }
}

struct HomeBrowseView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBrowseView()
    }
}
