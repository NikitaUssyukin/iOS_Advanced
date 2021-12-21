//
//  AlarmCellView.swift
//  SwiftUIAlarmApp
//
//  Created by Nikita on 22.10.2021.
//

//import SwiftUI
//
//struct AlarmCellView: View {
//    
//    @StateObject var viewModel: AlarmAppViewModel
//   
//    
//    var body: some View {
//        List {
//            ForEach (viewModel.alarms, id: \.self) { alarm in
//                AlarmCellContetntsView(viewModel: viewModel, alarm: alarm)
//            }.onDelete(perform: { indexSet in
//                for index in indexSet {
//                    print("I'm about to delete alarm at index...")
//                    print(index)
//                    viewModel.alarms.remove(at: index)
//                }
//            })
//        }
//        }
//}
//
//struct AlarmCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlarmCellView(viewModel: AlarmAppViewModel())
//    }
//}
