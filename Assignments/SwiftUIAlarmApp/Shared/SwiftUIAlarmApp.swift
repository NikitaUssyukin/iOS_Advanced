//
//  SwiftUIAlarmApp.swift
//  Shared
//
//  Created by Nikita on 22.10.2021.
//

import SwiftUI

@main
struct SwiftUIAlarmAppApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AlarmAppViewModel())
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
