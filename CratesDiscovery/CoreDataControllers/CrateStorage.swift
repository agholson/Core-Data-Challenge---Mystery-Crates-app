//
//  CrateStorage.swift
//  CratesDiscovery
//
//  Created by Leone on 1/17/22.
//

import Foundation
import CoreData
import Combine


/*
 The CrateStorage class singleton controls a single Entity in Core Data, the Crate Entity.
 It sends all of the crates to each subscriber of this entity.
 */
class CrateStorage: NSObject, ObservableObject {
    
    // Initialize a list of empty crates with Combine
    var crates = CurrentValueSubject<[Crate], Never>([])
    
    // Handles all interactions with Core Data for Crate entities
    private let cratesFetchController: NSFetchedResultsController<Crate>
    
    // Singleton instance of CrateStorage handles all interactions with the Crate Entity
    static let shared: CrateStorage = CrateStorage()
    
    private override init() {
        
        // Initialize a fetchRequest for our Crate
        let request = Crate.fetchRequest()

        // Make the sortDescriptors empty
        request.sortDescriptors = []
        
        // Initialize the fetch controller that gets results from the Core Data database
        cratesFetchController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: PersistenceController.shared.container.viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        
        super.init()
        
        // Gets notified as crates are fetched from the database
        cratesFetchController.delegate = self
        
        // Fetch the current crates in the database
        do {
            // Fetch the objects from Core Data
            try cratesFetchController.performFetch()
            
            // Update the crates property, this also updates the property relied on by the subscribed ViewModels
            crates.value = cratesFetchController.fetchedObjects ?? []
        }
        catch {
            print("Error occurred fetching data line 59 in CrateStorage")
        }
    }
    
}

extension CrateStorage: NSFetchedResultsControllerDelegate {
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        // Convert the fetchedObjects to a list of crates
        guard let crates = controller.fetchedObjects as? [Crate] else { return }
        print("Crates line 69 in CrateStorage \(crates)")
        self.crates.value = crates
        print("Self.crates line 71 in CrateStorage \(self.crates)")
    }
}
