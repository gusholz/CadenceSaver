import SwiftUI

struct AddChordCard: View {
    @FocusState private var isFocused: Bool
    @Binding var position: ChordsPositions
    @Binding var type: ChordsTypes
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(position.rawValue)\(type.rawValue)")
                .font(.title)
            InputPicker(label: "Position", value: $position, options: ChordsPositions.allCases)
            InputPicker(label: "Type", value: $type, options: ChordsTypes.allCases)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray, lineWidth: 2)
        )
    }
}
