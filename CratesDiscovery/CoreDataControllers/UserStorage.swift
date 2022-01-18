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
class UserStorage: NSObject, ObservableObject {
    
    // Initialize an empty User current value subject with Combine
    var user = CurrentValueSubject<User, Never>(User())
    
    // Handles all interactions with Core Data for Crate entities
    private let userFetchController: NSFetchedResultsController<User>
    
    // Singleton instance of CrateStorage handles all interactions with the Crate Entity
    static let shared: UserStorage = UserStorage()
    
    private override init() {
        
        // Initialize a fetchRequest for our Crate
        let request = User.fetchRequest()

        // Make the sortDescriptors empty
        request.sortDescriptors = []
        
        // Only retrieve one User from the database
        request.fetchLimit = 1
        
        // Initialize the fetch controller that gets results from the Core Data database
        userFetchController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: PersistenceController.shared.container.viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        
        super.init()
        
        // Gets notified as crates are fetched from the database
        userFetchController.delegate = self
        
        // Fetch the current crates in the database
        do {
            // Fetch the objects from Core Data
            try userFetchController.performFetch()
            
            if let fetchedObjects = userFetchController.fetchedObjects {
                // Update the crates property, this also updates the property relied on by the subscribed ViewModels
                user.value = fetchedObjects.first!
            }
            
        }
        catch {
            print("Error occurred fetching data line 59 in CrateStorage")
        }
    }
    
    /*
     Adds a new user to the Core Data database
     */
    func add(name: String) {
        
        let viewContext = PersistenceController.shared.container.viewContext
        
        let newUser = User(context: viewContext)
        
        // Set the id
        newUser.id = UUID()
        
        // Set the name
        newUser.name = name
        
        // Save this to the Core Data database
        try! viewContext.save()
    }
    
}

extension UserStorage: NSFetchedResultsControllerDelegate {
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        // Convert the fetchedObjects to a list of crates
        guard let user = controller.fetchedObjects?.first as? User else { return }
        self.user.value = user
    }
}
