//
//  ExpenseAddView.swift
//  FinanceTrackingAssistant
//
//  Created by Yakuza on 22/12/2021.
//

import SwiftUI
import Combine

struct ExpenseAddView: View {
    
    @EnvironmentObject var viewModel: FTAViewModel
    @State var expenseAmount = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Amount Spent", text: $expenseAmount)
                    .keyboardType(.numberPad)
                    .onReceive(Just(expenseAmount)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.expenseAmount = filtered
                        }
                    }
                Button("Add Expense") {
                    viewModel.addExpense(amount: Int64(expenseAmount)!)
                }
//                Picker("Currency", selection: <#T##Binding<_>#>)
//                Picker("Category", selection: <#T##Binding<_>#>)
                
            }
        }
    }
}

struct ExpenseAddView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseAddView()
    }
}
