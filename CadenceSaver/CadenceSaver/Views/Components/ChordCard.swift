import SwiftUI

struct AddChordCard: View {
    @Binding var chord: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextField("Enter chord", text: $chord)
            .textFieldStyle(PlainTextFieldStyle())
            .font(.title2.bold())
            .multilineTextAlignment(.center)
            .padding()
            .frame(width: 120, height: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isFocused ? Color.blue : Color.gray, lineWidth: 3)
            )
            .background(Color.white)
            .cornerRadius(12)
            .focused($isFocused)
            .onTapGesture {
                isFocused = true
            }
    }
}

#Preview {
    @Previewable @State var chord = "Cmaj7"
    return AddChordCard(chord: $chord)
}
