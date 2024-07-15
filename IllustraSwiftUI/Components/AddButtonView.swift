//
//  AddButtonView.swift
//  IllustraSwiftUI
//
//  Created by Sabr on 13.07.2024.
//

import SwiftUI

struct AddButtonView: View {
    var body: some View {
        Image(systemName: "plus")
            .font(.system(size: 24, weight: .thin))
            .foregroundColor(.white)
            .padding()
            .frame(width: 70, height: 40)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 0.7922101439))]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(25)
            .shadow(radius: 10)
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView()            
    }
}
