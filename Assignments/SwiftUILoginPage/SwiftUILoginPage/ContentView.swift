//
//  ContentView.swift
//  SwiftUILoginPage
//
//  Created by Yakuza on 16/09/2021.
//

import SwiftUI

struct ContentView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150, alignment: .center)
                        .opacity(0.9)
                    Text("Welcome to SwiftUI")
                        .fontWeight(.bold)
                        .font(.system(size: 37))
                        .font(.title)
                        .scaledToFit()
                        .frame(maxWidth: 500)
                        .lineLimit(nil)
                        .minimumScaleFactor(0.3)
                        .padding(.leading)
                        .padding(.trailing)
                    
                    VStack {
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(.gray)
                                .padding(.top)
                                .padding(.bottom)
                                .padding(.leading)
                            
                            TextField("Email", text: $email)
                        }
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.bottom)
                        
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.gray)
                                .padding(.top)
                                .padding(.bottom)
                                .padding(.leading)
                            
                            SecureField("Password", text: $password)
                        }
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.bottom)
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Login")
                                .fontWeight(.bold)
                                .font(.system(size: 22))
                                .padding()
                                .scaledToFit()
                                .frame(maxWidth: 500)
                                .frame(maxHeight: 50)
                                .foregroundColor(Color.white)
                                .background(Color.accentColor)
                                .opacity(0.9)
                                .cornerRadius(8)
                        })
                    }
                    .padding()
                    
                    
                    Spacer()
                }
            }
            .background(Image("BackgroundImage").blur(radius: 3.0))
        }
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
