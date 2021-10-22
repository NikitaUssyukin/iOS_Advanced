//
//  AlarmAddView.swift
//  SwiftUIAlarmApp
//
//  Created by Nikita on 22.10.2021.
//

import SwiftUI

struct AlarmAddView: View {
    @State var pickerTime = Date()
    @State var textField: String = ""
    @State var viewModel: AlarmAppViewModel
    @Environment(\.presentationMode) var presentationMode
    let dateFormatter = DateFormatter()
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    DatePicker("", selection: $pickerTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .scaledToFill()
                        .datePickerStyle(.wheel)
                    
                }.frame(width: 400, height: 270)
                VStack {
                    TextField(" ", text: $textField)
                        .padding()
                }
                    .frame(width: 400, height: 54)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                    
                    
                Spacer()
                
                Button("Save") {
                    dateFormatter.setLocalizedDateFormatFromTemplate("HH:mm a")
                    dateFormatter.amSymbol = ""
                    dateFormatter.pmSymbol = ""
                    dateFormatter.locale = Locale(identifier: "en_US")
                    var convertedTime: String = dateFormatter.string(from: pickerTime)
                    print(convertedTime)
                    viewModel.appendAlarm(alarmTime: convertedTime, alarmDetails: textField)
                    convertedTime = ""
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
            }
            .navigationBarTitle("New alarm")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
            .frame(maxWidth: 400, maxHeight: 700)
        }
        
      
    }
}

struct AlarmAddView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmAddView(viewModel: AlarmAppViewModel())
    }
}
