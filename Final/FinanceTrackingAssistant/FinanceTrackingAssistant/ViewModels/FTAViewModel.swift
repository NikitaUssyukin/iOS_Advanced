//
//  FTAViewModel.swift
//  FinanceTrackingAssistant
//
//  Created by Yakuza on 22/12/2021.
//

import Foundation
import SwiftUI
import CoreData



class FTAViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedExpenses: [Expense] = []
    @Published var savedCategories: [Category] = []

    init() {
        container = NSPersistentContainer(name: "FinanceTrackingAssistant")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        fetchExpenses()
        fetchCategories()
    }
    
    func fetchExpenses() {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        
        do {
            savedExpenses = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func fetchCategories() {
        let request = NSFetchRequest<Category>(entityName: "Category")
        
        do {
            savedCategories = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addExpense() {
        withAnimation {
            let newExpense = Expense(context: container.viewContext)
            newExpense.id = UUID()
            newExpense.timestamp = Date()
            newExpense.amount = Int64(Int.random(in: 0...300))
            newExpense.currency = "USD"
            newExpense.category = "General"

            do {
                print("id: \(newExpense.id), amount: \(newExpense.amount), currency: \(newExpense.currency), category: \(newExpense.id), category: \(newExpense.id)")
                try container.viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            fetchExpenses()
        }
    }
    
    func addExpense(amount: Int64) {
        withAnimation {
            let newExpense = Expense(context: container.viewContext)
            newExpense.id = UUID()
            newExpense.timestamp = Date()
            newExpense.amount = amount
            newExpense.currency = "USD"
            newExpense.category = "General"

            do {
                try container.viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            fetchExpenses()
        }
    }
    
    func addCategory() {
        withAnimation {
            let newCategory = Category(context: container.viewContext)
            newCategory.id = UUID()
            newCategory.color = ""
            newCategory.image = ""
            newCategory.name = "New Category"
            do {
                try container.viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            fetchCategories()
        }
    }
    
    func addCategory(name: String, color: String, image: String) {
        withAnimation {
            let newCategory = Category(context: container.viewContext)
            newCategory.id = UUID()
            newCategory.color = color
            newCategory.image = image
            newCategory.name = name
            do {
                try container.viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            fetchCategories()
        }
    }
    

    func deleteExpense(offsets: IndexSet) {
        withAnimation {
            offsets.map { savedExpenses[$0] }.forEach(container.viewContext.delete)

            do {
                try container.viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            fetchExpenses()
        }
    }
    
    func deleteCategory(offsets: IndexSet) {
        withAnimation {
            offsets.map { savedCategories[$0] }.forEach(container.viewContext.delete)

            do {
                try container.viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            fetchCategories()
        }
    }
}
