//
//  Models.swift
//  ContactBook
//
//  Created by Nikita on 24.09.2021.
//

import Foundation

struct ContactInfo : Identifiable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var gender: String
}

