//
//  ProgressionCard.swift
//  CadenceSaver
//
//  Created by Gustavo Holzmann on 05/03/25.
//

import SwiftUI

struct ProgressionCard: View {
    var progression: ProgressionModel
    
    var body: some View {
        HStack {
            VStack {
                Text(progression.name)
                Text("\(progression.numberOfChords)" + " chords")
            }
        }
    }
    
}
