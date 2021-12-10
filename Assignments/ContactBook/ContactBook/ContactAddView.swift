//
//  ContactAddView.swift
//  ContactBook
//
//  Created by Nikita on 01.10.2021.
//

import SwiftUI

struct ContactAddView: View {
    @State var contactBeingAdded: ContactInfo = ContactInfo(id: UUID(), firstName: "", lastName: "", phoneNumber: "", gender: "")
    var viewModel: ContactViewModel
    
    
    var body: some View {
        VStack{
            TextField("First name", text: $contactBeingAdded.firstName).padding()
            TextField("Last name", text: $contactBeingAdded.lastName).padding()
            TextField("Phone number", text: $contactBeingAdded.phoneNumber).padding()
            Picker("Gender", selection: $contactBeingAdded.gender, content: {
                Text("Male").tag("male")
                Text("Female").tag("female")
            }).toolbar {
                Button("Add contact"){
                    viewModel.appendContact(firstName: contactBeingAdded.firstName, lastName: contactBeingAdded.lastName, phoneNumber: contactBeingAdded.phoneNumber, gender: contactBeingAdded.gender)
                    print(contactBeingAdded.gender)
                }

            }
        }
        .padding()
    }
}

