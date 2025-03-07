//
//  Progression.swift
//  CadenceSaver
//
//  Created by Gustavo Holzmann on 17/01/25.
//

import Foundation

struct ProgressionModel: Codable, Identifiable  {
    var name: String
    var id: UUID
    var numberOfChords: Int
    var sensations: String
    var chords: [Chord]
    
    init(name: String, numberOfChords: Int, sensations: String, chords: [Chord]) {
        self.name = name
        self.id = UUID()
        self.numberOfChords = numberOfChords
        self.sensations = sensations
        self.chords = chords
    }
    
    init(progressionEntity: Progression?) {
        self.name = progressionEntity?.name ?? ""
        self.id = UUID()
        self.numberOfChords = Int(progressionEntity?.numberOfChords ?? 2)
        self.sensations = progressionEntity?.sensations ?? ""

        if let chordsData = progressionEntity?.chords as? Data {
            do {
                self.chords = try JSONDecoder().decode([Chord].self, from: chordsData)
            } catch {
                print("Error decoding chords: \(error.localizedDescription)")
                self.chords = []
            }
        } else {
            self.chords = []
        }
    }

}
