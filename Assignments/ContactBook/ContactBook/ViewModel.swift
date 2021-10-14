//
//  ViewModel.swift
//  ContactBook
//
//  Created by Nikita on 24.09.2021.
//

import Foundation

class ContactViewModel: ObservableObject {
    @Published var contactList: ContactInfo = contacts[1]
}
