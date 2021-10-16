//
//  ImageViewModel.swift
//  BigImagesGCD
//
//  Created by Nikita on 15.10.2021.
//

import SwiftUI

class ImageViewModel: ObservableObject {
    @Published private(set) var image: UIImage? = nil
    
    func getImage(url: String) {
        self.image = nil
        DispatchQueue.global(qos: .userInteractive).async {
            guard let imageURL = URL(string: url) else {
                fatalError("Invalid URL")
            }
            guard let imageData = try? Data (contentsOf: imageURL) else {
                fatalError("Can't get the image")
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        }
    }
}
