//
//  ContentView.swift
//  ContactBook
//
//  Created by Yakuza on 17/09/2021.
//

import SwiftUI

var contacts = [
    ContactInfo(id: UUID(), firstName: "Samuel", lastName: "Hayden", phoneNumber: "87008700666", gender: "male"),
    ContactInfo(id: UUID(), firstName: "Nikita", lastName: "Ussyukin", phoneNumber: "87007339155", gender: "male"),
    ContactInfo(id: UUID(), firstName: "James", lastName: "Bond", phoneNumber: "87007007007", gender: "male")
]


struct ContentView: View {
    @StateObject var viewModel = ContactViewModel()
    
    @State var contacts = [
        ContactInfo(id: UUID(), firstName: "Samuel", lastName: "Hayden", phoneNumber: "87008700666", gender: "male"),
        ContactInfo(id: UUID(), firstName: "Nikita", lastName: "Ussyukin", phoneNumber: "87007339155", gender: "male"),
        ContactInfo(id: UUID(), firstName: "James", lastName: "Bond", phoneNumber: "87007007007", gender: "male")
    ]
    
    var mockSample: String = "Тупое говно тупого говна!"
    
    var body: some View {
        NavigationView {
            List {
                ForEach (contacts) { contact in
                    NavigationLink(destination: ContactView(contactInfo: contact)) {
                        ContactView(contactInfo: contact)
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        contacts.remove(at: index)
                    }
                })
                
                
            }
            .navigationBarTitle(Text("Contacts"))
            .toolbar {
                NavigationLink(destination: ContactAddView(sample: mockSample)) {
                    ContactAddView(sample: mockSample)
            }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
