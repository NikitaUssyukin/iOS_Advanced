//
//  AlarmAppViewModel.swift
//  SwiftUIAlarmApp
//
//  Created by Nikita on 22.10.2021.
//

import Foundation
import SwiftUI

class AlarmAppViewModel: ObservableObject {
    @Environment(\.managedObjectContext) var moc
    
    func appendAlarm(alarmTime: String, alarmDetails: String) {
        let alarm = Alarm(context: moc)
        alarm.id = UUID()
        alarm.alarmTime = "\(alarmTime)"
        alarm.alarmDetails = "\(alarmDetails)"
        alarm.isActive = true
        
        try? moc.save()
    }
    
    func toggleAlarm(at: Int, toggleState: Bool) {

    }
}
