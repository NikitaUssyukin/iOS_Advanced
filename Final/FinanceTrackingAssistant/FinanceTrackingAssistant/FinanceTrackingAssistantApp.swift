//
//  FinanceTrackingAssistantApp.swift
//  FinanceTrackingAssistant
//
//  Created by Nikita on 21.12.2021.
//

import SwiftUI

@main
struct FinanceTrackingAssistantApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
