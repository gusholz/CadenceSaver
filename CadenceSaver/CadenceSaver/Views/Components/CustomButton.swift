//
//  CustomButton.swift
//  CadenceSaver
//
//  Created by Gustavo Holzmann on 17/01/25.
//

import SwiftUI

struct CustomButton: View {
    
    var buttonLabel: String
    var buttonAction: () -> Void
    
    var body: some View {
        Button {
            buttonAction()
        } label: {
            Text(buttonLabel)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
                .frame(width: 327)
                .background(.blue)
                .cornerRadius(8)
                .contentShape(Rectangle())
        }
    }
}
