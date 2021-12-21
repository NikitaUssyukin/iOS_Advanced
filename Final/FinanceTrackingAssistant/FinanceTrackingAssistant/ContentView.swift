//
//  ContentView.swift
//  FinanceTrackingAssistant
//
//  Created by Nikita on 21.12.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //CoreData
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Expense.timestamp, ascending: true)],
        animation: .default)
    private var expenses: FetchedResults<Expense>
    
    //State variables
    @State var selectedIndex = 1
    @State var isShowingAddView = false
    @State var categoryString = ""
    @State var currencyString = ""
    
    
    
    var body: some View {
        VStack(spacing: 0) {
            MainHeaderView(selectedIndex: $selectedIndex)
            TabView(selection: $selectedIndex) {
                NavigationView {
                    VStack {
                        Text("You're in a home navView!")
                        TextField("Input Category", text: $categoryString)
                        Button() {
                            Text("Add Category")
                        }
                    }
                }
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
                NavigationView {
                    List {
                        ForEach(expenses) { expense in
                            NavigationLink {
                                Text("Expense at \(expense.timestamp!, formatter: expenseFormatter)")
                                Text("Expense currency: \(expense.currency ?? "Unknown")")
                                Text("Expense amount: \(expense.amount)")
                                Text("Expense category: \(expense.category ?? "Unknown")")
                            } label: {
                                Text(expense.timestamp!, formatter: expenseFormatter)
                                Text("Expense currency: \(expense.currency ?? "Unknown")")
                                Text("Expense amount: \(expense.amount)")
                                Text("Expense category: \(expense.category ?? "Unknown")")
                            }
                        }
                        .onDelete(perform: deleteExpenses)
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                        ToolbarItem {
                            Button("Add") {
//                                Label("Add Expense", systemImage: "plus")
                                isShowingAddView.toggle()
                            }
                            .sheet(isPresented: $isShowingAddView) {
                                ExpenseAddView()
                            }
                        }
                    }
                    Text("Select an Expense")
                }
                .tabItem {
                    Label("Categories", systemImage: "list.bullet.circle.fill")
                }
                .tag(1)
                NavigationView {
                    VStack {
                        Text("You're in a profile navView!")
                    }
                }
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }

    private func addExpense() {
        withAnimation {
            let newExpense = Expense(context: viewContext)
            newExpense.timestamp = Date()
            newExpense.amount = Int64(Int.random(in: 0...300))
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
    
    private func addCategory() {
        withAnimation {
            let newCategory = Category(context: viewContext)
            newExpense.timestamp = Date()
            newExpense.amount = Int64(Int.random(in: 0...300))
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
    

    private func deleteExpenses(offsets: IndexSet) {
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

private let expenseFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

//Code for custom tab view

struct HighlightedMenuItem: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding([.leading, .trailing])
            .padding([.top, .bottom], 4)
            .foregroundColor(.black)
    }
}

struct UnhighlightedMenuItem: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding([.leading, .trailing])
            .padding([.top, .bottom], 4)
            .foregroundColor(.black)
    }
}

extension View {
    func highlighted() -> some View {
        self.modifier(HighlightedMenuItem())
    }
    
    func unhighlighted() -> some View {
        self.modifier(UnhighlightedMenuItem())
    }
}

struct MainHeaderView: View {
    @Binding var selectedIndex: Int
    @Environment(\.colorScheme) var colorScheme
    @Namespace private var tabSelection

    var body: some View {
        HStack{
            Spacer()
            if selectedIndex == 0 {
                Label("Home", systemImage: "house.fill")
                    .font(.system(size: 18))
                    .highlighted()
                    .background(menuCapsule)
            } else {
                Label("Home", systemImage: "house.fill")
//                    .labelStyle(IconOnlyLabelStyle())
                    .font(.system(size: 18))
                    .unhighlighted()
                    .onTapGesture {selectedIndex = 0 }
            }
            Spacer()
            if selectedIndex == 1 {
                Label("Categories", systemImage: "list.bullet.circle.fill")
                    .font(.system(size: 18))
                    .highlighted()
                    .background(menuCapsule)
            } else {
                Label("Categories", systemImage: "list.bullet.circle.fill")
//                    .labelStyle(IconOnlyLabelStyle())
                    .font(.system(size: 18))
                    .unhighlighted()
                    .onTapGesture {selectedIndex = 1 }
            }
            Spacer()
            if selectedIndex == 2 {
                Label("Profile", systemImage: "person.circle.fill")
                    .font(.system(size: 18))
                    .highlighted()
                    .background(menuCapsule)
            } else {
                Label("Profile", systemImage: "person.circle.fill")
//                    .labelStyle(IconOnlyLabelStyle())
                    .font(.system(size: 18))
                    .unhighlighted()
                    .onTapGesture {selectedIndex = 2 }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(8)
        .font(.subheadline)
        .foregroundColor(colorScheme == .dark ? Color(UIColor.lightText) : Color(UIColor.darkGray))
        .animation(.easeOut(duration: 0.2), value: selectedIndex)
    }
    var menuCapsule: some View {
        Capsule()
            .foregroundColor(.yellow)
            .matchedGeometryEffect(id: "capsule", in: tabSelection)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
