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
            return result.map { progression in
                    .init(progressionEntity: progression)
            }
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func createProgression(progression: ProgressionModel) {
        let newProgression = Progression(context: context)
        newProgression.id = UUID()
        newProgression.name = progression.name
        newProgression.chords = progression.chords as NSObject
        newProgression.numberOfChords = Int16(progression.numberOfChords)
        newProgression.sensations = progression.sensations
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
