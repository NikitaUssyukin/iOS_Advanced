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
        VStack (alignment: .leading){
            HStack {
                Image(contactInfo.gender)
                    .resizable()
                    .scaledToFit()
                    .padding(.trailing)
                    .frame(alignment: .leading)
                Text(contactInfo.firstName)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .frame(alignment: .leading)
                Text(contactInfo.lastName)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .frame(alignment: .leading)
                Spacer()
            }
            
            .frame(maxWidth: .infinity)
            
            Text(contactInfo.phoneNumber)
                .font(.subheadline)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 60)
    }
}


