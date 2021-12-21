//
//  CoreDataTestApp.swift
//  CoreDataTest
//
//  Created by Nikita on 20.12.2021.
//

import SwiftUI

@main
struct CoreDataTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
