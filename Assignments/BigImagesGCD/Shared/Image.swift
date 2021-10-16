//
//  Image.swift
//  BigImagesGCD
//
//  Created by Nikita on 15.10.2021.
//

import Swift

struct Image: Codable {
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "message"
    }
}
