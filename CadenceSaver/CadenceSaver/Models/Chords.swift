//
//  Chords.swift
//  CadenceSaver
//
//  Created by Gustavo Holzmann on 06/03/25.
//

struct Chord: Hashable, Identifiable, Codable {
    
    var position: ChordsPositions
    var type: ChordsTypes
    
    var id: String {
        return position.rawValue + type.rawValue
    }
}

enum ChordsPositions: String, CaseIterable, Identifiable, Codable {
    case I = "I"
    case II = "II"
    case III = "III"
    case IV = "IV"
    case V = "V"
    case VI = "VI"
    case VII = "VII"
    case i = "i"
    case ii = "ii°"
    case iii = "iii"
    case iv = "iv"
    case v = "v"
    case vi = "vi"
    case vii = "vii"
    
    var id: String {self.rawValue}
}

enum ChordsTypes: String, CaseIterable, Identifiable, Codable {
    case major = "maj"
    case maj6th = "maj6th"
    case major7th = "maj7"
    case major9th = "maj9"
    case major11th = "maj11"
    case major13th = "maj13"
    
    case minor = "min"
    case min6th = "min6th"
    case minor7th = "min7"
    case minor9th = "min9"
    case minor11th = "min11"
    case minor13th = "min13"
    case minorMajor7th = "min(maj7)"
   
    case diminished7th = "dim7"
    case halfDiminished7th = "m7♭5"
    case augmented7th = "aug7"
    
    case dominant7th = "7"
    case dominant9th = "9"
    case dominant11th = "11"
    case dominant13th = "13"
    
    case suspended2th = "sus2"
    case suspended4th = "sus4"
    case dominant7thSuspended4th = "7sus4"
    
    case add9 = "add9"
    case minorAdd9 = "min(add9)"
    case add11 = "add11"
    
    
    var id: String {self.rawValue}
}
