//
//  ExpenseAddView.swift
//  FinanceTrackingAssistant
//
//  Created by Yakuza on 22/12/2021.
//

import SwiftUI
import Combine

struct ExpenseAddView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @State var expense = Expense()
    @State var expenseAmountString = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Amount Spent", text: $expenseAmountString)
                    .keyboardType(.numberPad)
                    .onReceive(Just(expenseAmountString)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.expense.amount = Int64(filtered) ?? 0
                        }
                    }
                Picker("Currency", selection: <#T##Binding<_>#>)
                Picker("Category", selection: <#T##Binding<_>#>)
                
            }
        }
    }
}

struct ExpenseAddView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseAddView()
    }
}
