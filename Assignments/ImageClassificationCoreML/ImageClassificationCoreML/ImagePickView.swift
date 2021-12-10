//
//  ImagePickView.swift
//  ImageClassificationCoreML
//
//  Created by Nikita on 10.12.2021.
//

import SwiftUI

struct ImagePickView: View {
    @StateObject var detectorVM: DetectorViewModel
    var numberOfImages = 12
    @State var currentIndexSwitch = false
    var body: some View {
        VStack {
            TabView(selection: $detectorVM.detectorModel.currentIndex) {
                ForEach(0..<numberOfImages) { num in Image("Image\(num)")
                        .resizable()
                        .scaledToFit()
                        .tag(num)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .padding()
            Button("Click me") {
                print(detectorVM.detectorModel.currentIndex)
            }
        }
            
    }
}

struct ImagePickView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickView(detectorVM: DetectorViewModel())
    }
}
