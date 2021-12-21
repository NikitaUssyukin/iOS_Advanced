//
//  AlarmDetailsView.swift
//  SwiftUIAlarmApp
//
//  Created by Nikita on 22.10.2021.
//

//import SwiftUI
//
//struct AlarmDetailsView: View {
//    @State var pickerTime = Date()
//    @State var textField: String = ""
//    @State var viewModel: AlarmAppViewModel
//    @Environment(\.presentationMode) var presentationMode
//    @Binding var alarm: Alarm
//    let dateFormatter = DateFormatter()
//
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                HStack {
//                    DatePicker("", selection: $pickerTime, displayedComponents: .hourAndMinute)
//                        .labelsHidden()
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .scaledToFill()
//                        .datePickerStyle(.wheel)
//
//                }.frame(width: 400, height: 270)
//                VStack {
//                    TextField(" ", text: $textField)
//                        .padding()
//                }
//                    .frame(width: 400, height: 54)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 16)
//                            .stroke(Color.gray, lineWidth: 2)
//                    )
//
//
//                Spacer()
//
//                Button("Delete") {
//                    viewModel.alarms.remove(at: viewModel.alarms.firstIndex(of: alarm)!)
//                    presentationMode.wrappedValue.dismiss()
//                }
//                .foregroundColor(.white)
//                .frame(maxWidth: .infinity)
//                .padding()
//                .background(Color.red)
//
//                Button("Change") {
//                    dateFormatter.setLocalizedDateFormatFromTemplate("HH:mm a")
//                    dateFormatter.amSymbol = ""
//                    dateFormatter.pmSymbol = ""
//                    dateFormatter.locale = Locale(identifier: "en_US")
//                    var convertedTime: String = dateFormatter.string(from: pickerTime)
//                    print(convertedTime)
//                    alarm.alarmTime = convertedTime
//                    alarm.alarmDetails = textField
//                    convertedTime = ""
//                }
//                .foregroundColor(.white)
//                .frame(maxWidth: .infinity)
//                .padding()
//                .background(Color.blue)
//            }
//            .navigationBarTitle("Change alarm")
//            .navigationBarTitleDisplayMode(.inline)
//            .frame(maxWidth: 400, maxHeight: 700)
//        }
//        .onAppear {
//            dateFormatter.setLocalizedDateFormatFromTemplate("HH:mm a")
//            dateFormatter.amSymbol = ""
//            dateFormatter.pmSymbol = ""
//            dateFormatter.locale = Locale(identifier: "en_US")
//            pickerTime = dateFormatter.date(from: "\(alarm.alarmTime)")!
//            textField = alarm.alarmDetails
//        }
//
//
//    }
//}
/*
struct AlarmDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmDetailsView(viewModel: AlarmAppViewModel(), alarm)
    }
}
*/
