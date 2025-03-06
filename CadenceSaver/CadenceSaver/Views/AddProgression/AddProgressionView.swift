import SwiftUI

struct AddProgressionView: View {
    @State private var numberOfChords = 2
    @State private var progressionName: String = ""
    @State private var sensations: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var viewModel = AddProgressionViewModel()
    @StateObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Add new progression")
                .font(.title)

            TextField("Name", text: $progressionName)
                .textFieldStyle(.roundedBorder)
            
            TextField("Sensations", text: $sensations)
                .textFieldStyle(.roundedBorder)

            
            // Picker to choose the number of chords
            Picker("Number of chords", selection: $numberOfChords) {
                ForEach(2...8, id: \.self) { num in
                    Text("\(num) Chords").tag(num)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .onChange(of: numberOfChords) { _, newValue in
                viewModel.updateChords(to: newValue)
            }

            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<viewModel.chords.count, id: \.self) { index in
                        AddChordCard(chord: $viewModel.chords[index])
                    }
                }
            }
            
            Spacer()
            
            CustomButton(buttonLabel: "Adicionar Progressão") {
                homeViewModel.createProgression(progressionName: progressionName, sensations: sensations, numberOfChords: numberOfChords, chords: viewModel.chords)
                dismiss()
            }
            .disabled(viewModel.isInvalidProgression(progressionName: progressionName, sensations: sensations))
        }
        .padding()
        .onAppear {
            viewModel.updateChords(to: numberOfChords)
        }
    }
}

#Preview {
    AddProgressionView(homeViewModel: HomeViewModel.init(progressionManager: ProgressionManager.shared))
}
