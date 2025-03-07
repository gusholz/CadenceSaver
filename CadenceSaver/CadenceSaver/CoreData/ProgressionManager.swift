//
//  ProgressionManager.swift
//  CadenceSaver
//
//  Created by Gustavo Holzmann on 17/01/25.
//

import CoreData

struct ProgressionManager {
    var context: NSManagedObjectContext
    static let shared = ProgressionManager()
    
    
    private init() {
        self.context = CoreDataManager.shared.viewContext
    }
    
    func getAllProgressions() -> [ProgressionModel]? {
        let request: NSFetchRequest<Progression> = Progression.fetchRequest()
        
        do {
            let result = try context.fetch(request)
            if result.isEmpty {
                return nil
            }
            let decodedProgressions = result.map { progression in
                let model = ProgressionModel(progressionEntity: progression)
                print("Decoded progression: \(model)")
                return model
            }
            return decodedProgressions
        } catch {
            print("Error fetching progressions: \(error.localizedDescription)")
            return nil
        }
    }

    
    func createProgression(progression: ProgressionModel) {
        let newProgression = Progression(context: context)
        newProgression.id = UUID()
        newProgression.name = progression.name
        
        do {
            let encodedChords = try JSONEncoder().encode(progression.chords)
            newProgression.chords = encodedChords
        } catch {
            print("Error encoding chords: \(error.localizedDescription)")
        }

        newProgression.numberOfChords = Int16(progression.numberOfChords)
        newProgression.sensations = progression.sensations
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }

}
