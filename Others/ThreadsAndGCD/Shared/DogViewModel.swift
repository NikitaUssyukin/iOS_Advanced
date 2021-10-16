//
//  DogViewModel.swift
//  ThreadsAndGCD
//
//  Created by Nikita on 15.10.2021.
//

import SwiftUI

class DogViewModel: ObservableObject {
    @Published private(set) var image: UIImage? = nil
    
    func getDog() {
        let url = "https://dog.ceo/api/breeds/image/random"
        let decoder = JSONDecoder()
        self.image = nil
        DispatchQueue.global(qos: .userInteractive).async {
            guard let jsonURL = URL(string: url) else {
                fatalError("Invalid URL")
            }
            guard let imageJSON = try? Data(contentsOf: jsonURL) else {
                fatalError("Could not get data from jsonURL")
            }
            guard let thisDog = try? decoder.decode(Dog.self, from: imageJSON) else {
                fatalError("There must be a problem decoding...")
            }
            guard let imageURL = URL(string: thisDog.imageURL) else {
                fatalError("Dog imageURL is invalid")
            }
            guard let imageData = try? Data(contentsOf: imageURL) else {
                fatalError("Can't get dog image data")
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        }
    }
    
    func getDogWithSession() {
        let url = "https://dog.ceo/api/breeds/image/random"
        let decoder = JSONDecoder()
        let session = URLSession.shared
        self.image = nil
        guard let jsonURL = URL(string: url) else {
            fatalError("Invalid URL")
        }
        session.dataTask(with: jsonURL) { data, _, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
            guard let imageJSON = try? Data(contentsOf: jsonURL) else {
                fatalError("Could not get data from jsonURL")
            }
            guard let thisDog = try? decoder.decode(Dog.self, from: imageJSON) else {
                fatalError("There must be a problem decoding...")
            }
            guard let imageURL = URL(string: thisDog.imageURL) else {
                fatalError("Dog imageURL is invalid")
            }
            guard let imageData = try? Data(contentsOf: imageURL) else {
                fatalError("Can't get dog image data")
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        }.resume()
    }
}
