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
            return result.map { progression in
                    .init(progressionEntity: progression)
            }
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
