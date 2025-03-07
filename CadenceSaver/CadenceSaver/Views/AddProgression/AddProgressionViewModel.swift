//
//  AddProgressionViewModel.swift
//  CadenceSaver
//
//  Created by Gustavo Holzmann on 05/03/25.
//

import Foundation

class AddProgressionViewModel: ObservableObject {
    @Published var chords: [Chord] = [
        Chord(position: .I, type: .major),
        Chord(position: .V, type: .major)
    ];

    func updateChords(to count: Int) {
        if chords.count < count {
            let newChords = (chords.count..<count).map { _ in
                Chord(position: .I, type: .major)
            }
            chords.append(contentsOf: newChords)
        } else if chords.count > count {
            chords = Array(chords.prefix(count))
        }
    }

    
    func isInvalidProgression(progressionName: String, sensations: String) -> Bool {
        if progressionName.isEmpty || sensations.isEmpty { return true }
        
        return false
    }
}
