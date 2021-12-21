//
//  ContentView.swift
//  Shared
//
//  Created by Nikita on 22.10.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AlarmAppViewModel
    @State var isShowingAddView = false
    
    var body: some View {
        NavigationView {
            VStack {
                if !viewModel.alarms.isEmpty {
                    AlarmCellView(viewModel: viewModel)
                }
            }
            .navigationBarTitle(Text("Alarms"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button() {
                isShowingAddView = true
            } label: {
                Image(systemName: "plus")
            }).sheet(isPresented: $isShowingAddView) {
                AlarmAddView(viewModel: viewModel)
            }
        }
        .onAppear {
            if viewModel.alarms.isEmpty {
                viewModel.appendAlarm(alarmTime: "23:30", alarmDetails: "Go to sleep")
                viewModel.appendAlarm(alarmTime: "6:30", alarmDetails: "Wake up")
                viewModel.appendAlarm(alarmTime: "11:00", alarmDetails: "Workout")
                viewModel.appendAlarm(alarmTime: "14:15", alarmDetails: "Take medicine")
                viewModel.appendAlarm(alarmTime: "12:10", alarmDetails: "Meet with Joe")
                viewModel.appendAlarm(alarmTime: "8:30", alarmDetails: "Go for a walk with a dog")
                viewModel.appendAlarm(alarmTime: "21:30", alarmDetails: "Prepare for sleep")
                viewModel.appendAlarm(alarmTime: "10:30", alarmDetails: "Go to the groceries")
            }
        }
        
        
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
