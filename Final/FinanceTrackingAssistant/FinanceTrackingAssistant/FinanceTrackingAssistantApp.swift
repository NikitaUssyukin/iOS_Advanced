//
//  FinanceTrackingAssistantApp.swift
//  FinanceTrackingAssistant
//
//  Created by Nikita on 21.12.2021.
//

import SwiftUI

@main
struct FinanceTrackingAssistantApp: App {
    @StateObject private var viewModel = FTAViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
