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
    }
    
    func updateList() {
        guard let fetchedList = progressionManager.getAllProgressions() else {
            return
        }
        
        self.progressionList = fetchedList
    }
    
    func createProgression(progressionName: String, sensations: String, numberOfChords: Int, chords: [String]) {
        let newProgression = ProgressionModel(name: progressionName, numberOfChords: numberOfChords, sensations: sensations, chords: chords)
        progressionManager.createProgression(progression: newProgression)
        self.updateList()
    }
    
    func deleteProgression() {
        
    }
    
    func editProgression() {
        
    }
}
