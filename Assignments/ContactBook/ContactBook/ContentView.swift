//
//  ContentView.swift
//  ContactBook
//
//  Created by Yakuza on 17/09/2021.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel = ContactViewModel()
    
    
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach (viewModel.contacts) { contact in
                    NavigationLink(destination: ContactView(contactInfo: contact)) {
                        ContactView(contactInfo: contact)
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        viewModel.contacts.remove(at: index)
                    }
                })
                
                
            }
            .navigationBarTitle(Text("Contacts"))
            .toolbar {
                NavigationLink("Add", destination: ContactAddView(viewModel: viewModel))
            }
            
        }.onAppear {
            if viewModel.contacts.isEmpty {
                viewModel.appendContact(firstName: "Samuel", lastName: "Hayden", phoneNumber: "87008700666", gender: "male")
                viewModel.appendContact(firstName: "Nikita", lastName: "Ussyukin", phoneNumber: "87007339155", gender: "male")
                viewModel.appendContact(firstName: "James", lastName: "Bond", phoneNumber: "87007007007", gender: "male")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
