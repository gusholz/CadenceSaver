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
    var baseScale: String
    var evokedFeelings: String
    var songsThatUseIt: [String]
    var chords: [String]
    
    init(name: String, id: UUID, numberOfChords: Int, baseScale: String, evokedFeelings: String, songsThatUseIt: [String], chords: [String]) {
        self.name = name
        self.id = id
        self.numberOfChords = numberOfChords
        self.baseScale = baseScale
        self.evokedFeelings = evokedFeelings
        self.songsThatUseIt = songsThatUseIt
        self.chords = chords
    }
    
    init(progressionEntity: Progression) {
        self.name = progressionEntity.name ?? ""
        self.id = progressionEntity.id ?? .init()
        self.numberOfChords = Int(progressionEntity.numberOfChords)
        self.baseScale = progressionEntity.baseScale ?? "Major"
        self.evokedFeelings = progressionEntity.evokedFeelings ?? ""
        self.songsThatUseIt = progressionEntity.songsThatUseIt as! [String]
        self.chords = progressionEntity.chords as! [String]
    }
}
