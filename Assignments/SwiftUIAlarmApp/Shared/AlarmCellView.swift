//
//  AlarmCellView.swift
//  SwiftUIAlarmApp
//
//  Created by Nikita on 22.10.2021.
//

import SwiftUI

struct AlarmCellView: View {
    
    @StateObject var viewModel: AlarmAppViewModel
    
    var body: some View {
        List {
            ForEach (viewModel.alarms.indices, id: \.self) { index in
                NavigationLink(destination: AlarmDetailsView()) {
                    HStack {
                        VStack (alignment: .leading) {
                                Text(viewModel.alarms[index].alarmTime).bold()
                                Text(viewModel.alarms[index].alarmDetails)
                            }
                            .padding()
                            Toggle(isOn: $viewModel.alarms[index].isActive) {
                                Text("")
                            }
                            .onTapGesture {
                                print("Current index is...")
                                print(index)
                                print("Current alarm state is...")
                                print(viewModel.alarms[index].isActive)
                            }
                            .padding()
                    }
                }
            }.onDelete(perform: { indexSet in
                for index in indexSet {
                    print("I'm about to delete alarm at index...")
                    print(index)
                    viewModel.alarms.remove(at: index)
                }
            })
        }
        }
}

struct AlarmCellView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmCellView(viewModel: AlarmAppViewModel())
    }
}
