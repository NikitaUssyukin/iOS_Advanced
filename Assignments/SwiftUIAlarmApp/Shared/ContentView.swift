//
//  ContentView.swift
//  Shared
//
//  Created by Nikita on 22.10.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = AlarmAppViewModel()
    @State var isShowingAddView = false
    
    var body: some View {
        NavigationView {
            VStack {
                if !viewModel.alarms.isEmpty {
                    AlarmCellView(viewModel: viewModel)
                }
            }
            .navigationBarTitle(Text("Alarms"))
            .navigationBarItems(trailing: Button("Add") {
                isShowingAddView = true
            }).sheet(isPresented: $isShowingAddView) {
                AlarmAddView(viewModel: viewModel)
            }
        }
        .onAppear {
            if viewModel.alarms.isEmpty {
                viewModel.appendAlarm(alarmTime: "23:30", alarmDetails: "Go to sleep")
                viewModel.appendAlarm(alarmTime: "6:30", alarmDetails: "Wake up")
            }
            print("finished onAppear in ContentView")
            print(viewModel.alarms[0].alarmTime)
        }
        
        
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
