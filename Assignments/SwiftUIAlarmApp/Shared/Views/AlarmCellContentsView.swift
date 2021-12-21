//
//  AlarmCellContentsView.swift
//  SwiftUIAlarmApp
//
//  Created by Nikita on 18.12.2021.
//

import Foundation
import SwiftUI

struct AlarmCellContetntsView: View {
    
    @ObservedObject var viewModel: AlarmAppViewModel
    @State var alarm: Alarm
    @State var isShowingDetailView = false
    
    var body: some View {
//        NavigationLink(destination: AlarmDetailsView(viewModel: viewModel, alarm: $alarm), isActive: $isShowingDetailView) {
//
//            }
        
        HStack {
            VStack (alignment: .leading) {
                    Text(alarm.alarmTime ?? "Unknown").bold()
                    Text(alarm.alarmDetails ?? "Unknown")
                }
                .padding()
                Toggle(isOn: $alarm.isActive) {
                    Text("")
                }
                .onTapGesture {
                    print("Current index is...")
                    print(index)
                    print("Current alarm state is...")
                    print(alarm.isActive)
                }
                .padding()
        }
    }
}
