//
//  Dog.swift
//  ThreadsAndGCD
//
//  Created by Nikita on 15.10.2021.
//

import Swift

struct Dog: Codable {
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "message"
    }
}
