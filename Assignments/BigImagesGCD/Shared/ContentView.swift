//
//  ContentView.swift
//  Shared
//
//  Created by Nikita on 15.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Swift", destination: ImageView(currentUrl: "https://1000marcas.net/wp-content/uploads/2021/06/Swift-Logo.png"))
            }.padding()
        }
        NavigationView {
            VStack {
                NavigationLink("Another Swift", destination: ImageView(currentUrl: "https://cdn.webshopapp.com/shops/308559/files/362505379/image.jpg"))
            }.padding()
        }
        NavigationView {
            VStack {
                NavigationLink("And one more Swift", destination: ImageView(currentUrl: "https://martin-baker.com/wp-content/uploads/2017/05/Mk2-Supermarine-Swift.png"))
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
