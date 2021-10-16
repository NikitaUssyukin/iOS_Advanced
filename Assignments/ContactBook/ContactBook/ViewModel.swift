//
//  ViewModel.swift
//  ContactBook
//
//  Created by Nikita on 24.09.2021.
//

import Foundation
import Swift

class ContactViewModel: ObservableObject {
    @Published var contacts: [ContactInfo] = []
    
    func appendContact(firstName: String, lastName: String, phoneNumber: String, gender: String) {
        self.contacts.append(ContactInfo(id: UUID(), firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, gender: gender))
    }
}
