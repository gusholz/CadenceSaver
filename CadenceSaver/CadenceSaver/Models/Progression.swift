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
    var chords: [String]
    
    init(name: String, numberOfChords: Int, sensations: String, chords: [String]) {
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
        self.chords = progressionEntity?.chords as! [String]
    }
}
