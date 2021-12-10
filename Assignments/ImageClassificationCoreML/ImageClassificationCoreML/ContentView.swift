//
//  ContentView.swift
//  ImageClassificationCoreML
//
//  Created by Nikita on 03.12.2021.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @ObservedObject var detectorVM = DetectorViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                    .padding()
                    
                }
                VStack {
                    Button(action: {
                    }) {
                        NavigationLink(destination: ImagePickView(detectorVM: detectorVM)) {
                            Text("Pick an image").foregroundColor(.blue)
                        }
                    }
                    Button("Print index") {
                        print(detectorVM.detectorModel.currentIndex)
                    }
                    Button("Detect objects") {
                        detectorVM.detectObjects(analysedImage: UIImage(named: "Image\(detectorVM.detectorModel.currentIndex)"))
                    }
                    Spacer()
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
