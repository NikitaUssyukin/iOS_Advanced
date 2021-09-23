//
//  ContentView.swift
//  ContactBook
//
//  Created by Yakuza on 17/09/2021.
//

import SwiftUI

struct ContactInfo : Identifiable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var phoneNumber: String
}

let contacts = [
    ContactInfo(firstName: "Samuel", lastName: "Hayden", phoneNumber: "87008700666"),
    ContactInfo(firstName: "Nikita", lastName: "Ussyukin", phoneNumber: "87007339155"),
    ContactInfo(firstName: "James", lastName: "Bond", phoneNumber: "87007007007")
]

struct ContentView: View {
    var body: some View {
        List(contacts, id: \.firstName) {
            contactInfo in ContactView(contactInfo: contactInfo)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
