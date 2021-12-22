//
//  FTAViewModel.swift
//  FinanceTrackingAssistant
//
//  Created by Yakuza on 22/12/2021.
//

import Foundation
import SwiftUI
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

//    static var preview: PersistenceController = {
//        let result = PersistenceController(inMemory: true)
//        let viewContext = result.container.viewContext
//        for _ in 0..<10 {
//            let newExpense = Expense(context: viewContext)
//            newExpense.timestamp = Date()
//        }
//        do {
//            try viewContext.save()
//        } catch {
//            // Replace this implementation with code to handle the error appropriately.
//            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//        return result
//    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "FinanceTrackingAssistant")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}

class FTAViewModel: ObservableObject {
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Expense.timestamp, ascending: true)],
        animation: .default)
    var expenses: FetchedResults<Expense>
    
    func addExpense() {
        withAnimation {
            let newExpense = Expense(context: self.viewContext)
            newExpense.id = UUID()
            newExpense.timestamp = Date()
            newExpense.amount = Int64(Int.random(in: 0...300))
            newExpense.currency = "USD"
            newExpense.category = "General"

            do {
                print("id: \(newExpense.id), amount: \(newExpense.amount), currency: \(newExpense.currency), category: \(newExpense.id), category: \(newExpense.id)")
                try self.viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func addExpense(amount: Int64) {
        withAnimation {
            let newExpense = Expense(context: viewContext)
            newExpense.id = UUID()
            newExpense.timestamp = Date()
            newExpense.amount = amount
            newExpense.currency = "USD"
            newExpense.category = "General"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
//    private func addCategory() {
//        withAnimation {
//            let newCategory = Category(context: viewContext)
//            newExpense.timestamp = Date()
//            newExpense.amount = Int64(Int.random(in: 0...300))
//            newExpense.currency = "USD"
//            newExpense.category = "General"
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
    

    func deleteExpense(offsets: IndexSet) {
        withAnimation {
            offsets.map { expenses[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
