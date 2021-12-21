//
//  SwiftUIAlarmApp.swift
//  Shared
//
//  Created by Nikita on 22.10.2021.
//

import SwiftUI

@main
struct SwiftUIAlarmAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AlarmAppViewModel())
        }
    }
}
