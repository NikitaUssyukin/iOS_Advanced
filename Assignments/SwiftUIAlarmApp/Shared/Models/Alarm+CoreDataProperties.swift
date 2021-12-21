//
//  Alarm+CoreDataProperties.swift
//  SwiftUIAlarmApp
//
//  Created by Nikita on 21.12.2021.
//
//

import Foundation
import CoreData


extension Alarm {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Alarm> {
        return NSFetchRequest<Alarm>(entityName: "Alarm")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var alarmTime: String?
    @NSManaged public var alarmDetails: String?
    @NSManaged public var isActive: Bool

}

extension Alarm : Identifiable {

}
