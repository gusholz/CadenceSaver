//
//  InputPicker.swift
//  CadenceSaver
//
//  Created by Gustavo Holzmann on 07/03/25.
//

import SwiftUI

struct InputPicker<T>: View where T: Hashable {
    var label: String
    @Binding var value: T
    var options: [T]
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(Color(.black))
            
            Spacer()
            Picker(label, selection: $value) {
                ForEach(options, id: \.self) { option in
                    buildOption(option)
                }
            }
            .labelsHidden()
            .tint(Color(.gray))
        }
    }
    
    @ViewBuilder
    func buildOption(_ option: T) -> some View {

        if let boolValue = option as? Bool {
            if boolValue {
                Text("Sim").tag(true)
            } else {
                Text("Não").tag(false)
            }
        } else if let rawValue = (option as? (any RawRepresentable))?.rawValue as? String {
            Text(String(describing: rawValue))
        } else if let chord = option as? Chord {
            Text(chord.id)
        } else {
            Text(String(describing: option))
        }
    }
}
