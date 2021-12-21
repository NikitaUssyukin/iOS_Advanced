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
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var alarms: FetchedResults<Alarm>
    
    var body: some View {
        
        NavigationView {
            VStack {
                List(alarms) { alarm in
                    AlarmCellContetntsView(viewModel: viewModel, alarm: alarm)
                }
                Button("Add") {
                    let alarmTimes = ["6:30", "10:00", "11:30", "14:45", "23:30"]
                    let alarmDetails = ["Go to sleep", "Wake up", "Workout", "Take medicine", "Meet with Joe"]
                    let isActive = [true, false]
                    
                    let chosenTime = alarmTimes.randomElement()!
                    let chosenDetails = alarmDetails.randomElement()!
                    let chosenState = isActive.randomElement()!
                    
                    let alarm = Alarm(context: moc)
                    alarm.id = UUID()
                    alarm.alarmTime = "\(chosenTime)"
                    alarm.alarmDetails = "\(chosenDetails)"
                    alarm.isActive = chosenState
                    
                    try? moc.save()
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

    }
}
    
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
