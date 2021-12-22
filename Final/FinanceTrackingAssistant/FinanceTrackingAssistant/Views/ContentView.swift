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
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Expense.timestamp, ascending: true)],
        animation: .default)
    var expenses: FetchedResults<Expense>
    
    //State variables
    @State var selectedIndex = 1
    @State var isShowingAddView = false
    @State var categoryString = ""
    @State var currencyString = ""
    
    //ViewModel
    @EnvironmentObject var viewModel: FTAViewModel
    
    
    var body: some View {
        VStack(spacing: 0) {
            MainHeaderView(selectedIndex: $selectedIndex)
            TabView(selection: $selectedIndex) {
                NavigationView {
                    VStack {
                        Text("You're in a home navView!")
                        TextField("Input Category", text: $categoryString)
                        Button("Add Category") {
                            print("clicked category")
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
                                if(expense.currency == "USD") {
                                    Label("\(expense.amount)", systemImage: "dollarsign.circle.fill")
                                }
//                                Text("Expense currency: \(expense.currency ?? "Unknown")")
//                                Text("Expense amount: \(expense.amount)")
                                Text("Expense category: \(expense.category ?? "Unknown")")
                            } label: {
                                Label("\(expense.amount)", systemImage: "dollarsign.circle.fill")
                                Text("Expense category: \(expense.category ?? "Unknown")")
                            }
                        }
                        .onDelete(perform: { indexSet in
                            viewModel.deleteExpense(offsets: indexSet, viewContext: viewContext)
                        })
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
                                ExpenseAddView().environment(\.managedObjectContext, viewContext)
                            }
                        }
                    }
                    Text("Select an Expense")
                    Button("Generate Random Expense") {
                        viewModel.addExpense(viewContext: viewContext)
                    }
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
//                    .font(.system(size: 18))
                    .highlighted()
                    .background(menuCapsule)
            } else {
                Label("Home", systemImage: "house.fill")
//                    .labelStyle(IconOnlyLabelStyle())
//                    .font(.system(size: 18))
                    .unhighlighted()
//                    .background(grayMenuCapsule)
                    .onTapGesture {selectedIndex = 0 }
            }
            Spacer()
            if selectedIndex == 1 {
                Label("Categories", systemImage: "list.bullet.circle.fill")
//                    .font(.system(size: 18))
                    .highlighted()
                    .background(menuCapsule)
            } else {
                Label("Categories", systemImage: "list.bullet.circle.fill")
//                    .labelStyle(IconOnlyLabelStyle())
//                    .font(.system(size: 18))
                    .unhighlighted()
//                    .background(grayMenuCapsule)
                    .onTapGesture {selectedIndex = 1 }
            }
            Spacer()
            if selectedIndex == 2 {
                Label("Profile", systemImage: "person.circle.fill")
//                    .font(.system(size: 18))
                    .highlighted()
                    .background(menuCapsule)
            } else {
                Label("Profile", systemImage: "person.circle.fill")
//                    .labelStyle(IconOnlyLabelStyle())
//                    .font(.system(size: 18))
                    .unhighlighted()
//                    .background(grayMenuCapsule)
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
//    var grayMenuCapsule: some View {
//        Capsule()
//            .foregroundColor(.gray)
//            .matchedGeometryEffect(id: "capsule", in: tabSelection)
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
