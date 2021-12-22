//
//  UIExtensions.swift
//  FinanceTrackingAssistant
//
//  Created by Yakuza on 23/12/2021.
//

import Foundation
import SwiftUI

extension View {
    func highlighted() -> some View {
        self.modifier(HighlightedMenuItem())
    }
    
    func unhighlighted() -> some View {
        self.modifier(UnhighlightedMenuItem())
    }
}
