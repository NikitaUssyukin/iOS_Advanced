//
//  DetectorViewModel.swift
//  ImageClassificationCoreML
//
//  Created by Nikita on 10.12.2021.
//

import Foundation
import SwiftUI
import CoreML
import UIKit

class DetectorViewModel: ObservableObject {
    
    @Published var detectorModel = DetectorModel()
    
    func detectObjects(analysedImage: UIImage?) {
        do {
            guard let imageBuffer = analysedImage?.resize(size: CGSize(width: 416, height: 416))?
                    .getCVPixelBuffer() else {
                return
            }
            let config = MLModelConfiguration()
            let mlModel = try WheelDetector(configuration: config)
            let input = WheelDetectorInput(imagePath: imageBuffer)
            let output = try mlModel.prediction(input: input)
            let type = output.featureValue(for: "confidence")
            let confidence = output.confidence
            let coordinates = output.coordinates
            print("Wheels:\(type) Confidence:\(confidence) Coordinates:\(coordinates)")
        }
        catch {
            
        }
        
    }
}

