//
//  Expense+CoreDataClass.swift
//  FinanceTrackingAssistant
//
//  Created by Yakuza on 22/12/2021.
//
//

import Foundation
import CoreData

@objc(Expense)
public class Expense: NSManagedObject {

    func Expense() {
        self.amount = 0
        self.currency = ""
        self.category = ""
        self.id = UUID()
        self.timestamp = Date()
    }
}
