//
//  ContentView.swift
//  ImageClassificationCoreML
//
//  Created by Nikita on 03.12.2021.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @StateObject var detectorVM = DetectorViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image("Image\(detectorVM.detectorModel.currentIndex)")
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
                    Button("Detect objects") {
                        detectorVM.detectObjects(analysedImage: UIImage(named: "Image\(detectorVM.detectorModel.currentIndex)"))
                    }
//                    if detectorVM.detectorModel.features != nil {
//                        Text(String(detectorVM.detectorModel.features!))
//                    }
//                    if detectorVM.detectorModel.confidence != nil {
//                        Text(String(detectorVM.detectorModel.confidence!))
//                    }
//                    if detectorVM.detectorModel.coordinates != nil {
//                        Text(String(detectorVM.detectorModel.coordinates!))
//                    }
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
