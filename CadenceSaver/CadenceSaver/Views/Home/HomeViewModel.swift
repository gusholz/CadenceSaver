//
//  HomeViewModel.swift
//  CadenceSaver
//
//  Created by Gustavo Holzmann on 17/01/25.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var progressionList: [ProgressionModel] = [];
    let progressionManager: ProgressionManager
    
    init(progressionManager: ProgressionManager) {
        self.progressionManager = progressionManager
        self.updateList()
    }
    
    // TODO: When the list goes to 0, the home doesn't display the correspondent view for empty progressionList
    func updateList() {
        guard let fetchedList = progressionManager.getAllProgressions() else {
            return
        }
        
        self.progressionList = fetchedList
    }
    
    func createProgression(progressionName: String, sensations: String, numberOfChords: Int, chords: [Chord]) {
        let newProgression = ProgressionModel(name: progressionName, numberOfChords: numberOfChords, sensations: sensations, chords: chords)
        progressionManager.createProgression(progression: newProgression)
        self.updateList()
    }
    
    func deleteProgression(id: UUID) {
        progressionManager.deleteProgressionById(id)
        self.updateList()
    }
    
    func editProgression() {
        
    }
}
