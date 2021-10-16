//
//  ContentView.swift
//  Shared
//
//  Created by Nikita on 15.10.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var dogVM = DogViewModel()
    @State private var backgroundIsGreen = false
    
    var body: some View {
        ZStack {
            Color(backgroundIsGreen ? .green : .white)
            VStack {
                Group {
                    if dogVM.image != nil {
                        Image(uiImage: dogVM.image!)
                            .resizable()
                            .frame(width: 320, height: 240)
                            .aspectRatio(contentMode: .fill)
                    } else {
                        Rectangle().stroke(lineWidth: 2).foregroundColor(.red).frame(width: 320, height: 240)
                    }
                    Button("Get Dog Image") {
                        self.dogVM.getDogWithSession()
                    }
                    Button("Change Background") {
                        self.backgroundIsGreen.toggle()
                    }
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
