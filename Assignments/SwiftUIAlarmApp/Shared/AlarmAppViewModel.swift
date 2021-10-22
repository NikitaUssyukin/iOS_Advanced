//
//  AlarmAppViewModel.swift
//  SwiftUIAlarmApp
//
//  Created by Nikita on 22.10.2021.
//

import Foundation

class AlarmAppViewModel: ObservableObject {
    @Published var alarms: [Alarm] = []
    
    func appendAlarm(alarmTime: String, alarmDetails: String) {
        self.alarms.append(Alarm(id: UUID(), alarmTime: alarmTime, alarmDetails: alarmDetails, isActive: true))
    }
    
    func toggleAlarm(at: Int, toggleState: Bool) {
        self.alarms[at].isActive = toggleState
    }
}
