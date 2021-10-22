//
//  AlarmModel.swift
//  SwiftUIAlarmApp
//
//  Created by Nikita on 22.10.2021.
//

import Foundation

struct Alarm : Identifiable, Hashable {
    var id = UUID()
    var alarmTime: String
    var alarmDetails: String
    var isActive: Bool
}
