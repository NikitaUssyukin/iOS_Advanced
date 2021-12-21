//
//  DetectorModel.swift
//  ImageClassificationCoreML
//
//  Created by Nikita on 10.12.2021.
//

import Foundation
import SwiftUI
import CoreML

struct DetectorModel {
    var currentIndex: Int = 0
    var features: Set<String>?
    var confidence: MLMultiArray?
    var coordinates: MLMultiArray?
}
