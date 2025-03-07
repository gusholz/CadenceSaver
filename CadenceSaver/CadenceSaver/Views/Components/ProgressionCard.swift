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
            VStack(alignment: .leading) {
                Text(progression.name)
                    .font(.title3)
                Text("\(progression.numberOfChords)" + " chords")
                    .font(.caption)
            }
            Spacer()
            
            ForEach(progression.chords,id: \.id) { chord in
                Text(chord.id)
                    .font(.caption)
            }
            
            Text("->")
                .font(.headline)
            
        }
        .onTapGesture {
            print(progression.numberOfChords)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray, lineWidth: 2)
        )
    }
    
}
