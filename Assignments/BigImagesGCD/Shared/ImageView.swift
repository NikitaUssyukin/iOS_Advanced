//
//  ImageView.swift
//  BigImagesGCD
//
//  Created by Nikita on 15.10.2021.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageVM = ImageViewModel()
    var currentUrl: String? = nil
    
    var body: some View {
        VStack {
            if imageVM.image != nil {
                Image(uiImage: imageVM.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Text("Loading...")
            }
        }.onAppear {
            self.imageVM.getImage(url: currentUrl!)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
