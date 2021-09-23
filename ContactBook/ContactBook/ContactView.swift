//
//  ContactView.swift
//  ContactBook
//
//  Created by Yakuza on 17/09/2021.
//

import SwiftUI

struct ContactView: View {
    
    var contactInfo: ContactInfo
    
    var body: some View {
        VStack {
            HStack {
                Text(contactInfo.firstName)
                    .font(.title)
                Text(contactInfo.lastName)
                    .font(.title)
            }
            .padding(.leading)
            .padding(.trailing)
            
            Text(contactInfo.phoneNumber)
                .font(.subheadline)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 60)
    }
}


