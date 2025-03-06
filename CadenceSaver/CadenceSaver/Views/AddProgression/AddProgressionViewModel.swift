//
//  AddProgressionViewModel.swift
//  CadenceSaver
//
//  Created by Gustavo Holzmann on 05/03/25.
//

import Foundation

class AddProgressionViewModel: ObservableObject {
    @Published var chords: [String] = ["I", "V"]

    func updateChords(to count: Int) {
        if chords.count < count {
            chords.append(contentsOf: Array(repeating: "I", count: count - chords.count))
        } else if chords.count > count {
            chords = Array(chords.prefix(count))
        }
    }
    
    func isInvalidProgression(progressionName: String, sensations: String) -> Bool {
        if progressionName.isEmpty || sensations.isEmpty { return true }
        
        return false
    }
}
