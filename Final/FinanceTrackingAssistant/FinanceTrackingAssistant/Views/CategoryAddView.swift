//
//  CategoryAddView.swift
//  FinanceTrackingAssistant
//
//  Created by Yakuza on 23/12/2021.
//

import SwiftUI

struct CategoryAddView: View {
    @EnvironmentObject var viewModel: FTAViewModel
    @State var categoryName = ""
    @State var categoryColor = ""
    @State var categoryImage = ""
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Input Category", text: $categoryName)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Input Color", text: $categoryColor)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Input Image", text: $categoryImage)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Add Category") {
                        viewModel.addCategory(name: categoryName, color: categoryColor, image: categoryImage)
                        print("clicked category")
                    }.padding()
                }
            }
        }
    }
}

struct CategoryAddView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryAddView()
    }
}
