//
//  HomeViewModel.swift
//  CadenceSaver
//
//  Created by Gustavo Holzmann on 17/01/25.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var isEmpty: Bool
    
    init(isEmpty: Bool) {
        self.isEmpty = isEmpty
    }
    
    func createProgression() {
        
    }
    
    func deleteProgression() {
        
    }
    
    func editProgression() {
        
    }
}
