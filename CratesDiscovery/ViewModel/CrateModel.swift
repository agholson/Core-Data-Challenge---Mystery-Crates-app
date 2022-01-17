//
//  CrateModel.swift
//  CratesDiscovery
//
//  Created by Leone on 1/16/22.
//

import Foundation


/*
 Main ViewModel used to determine all of the Views within the app
 */
class CrateModel: ObservableObject {
    
    var currentUser: User?
    
    init() {
        // Gets the current user, if the person was 
        getCurrentUser()
    }
    
    
    // MARK: - Core Data Access Methods
    /*
     Gets the user information from the default database for the iOS app user. It decodes
     the information from the database into a User class, and assigns it the value of the
     current user property
     From: https://www.hackingwithswift.com/example-code/system/how-to-load-and-save-a-struct-in-userdefaults-using-codable
     */
    func getCurrentUser(){
        // Access the UserDefaults database to determine whether/ not there was a logged-in user
        let defaults = UserDefaults.standard
        
        // Try to load the user from Core Data
        let loadedUser = defaults.object(forKey: "currentUser") as? Data
        
        // If the user exists
        if loadedUser != nil {
            // Try to decode that JSON into our User class
            let decoder = JSONDecoder()
            
            if let decodedUser = try? decoder.decode(User.self, from: loadedUser!) {
                self.currentUser = decodedUser
                print("Successfully loaded user")
            }
            else {
                print("No user logged in")
            }
        }
    }
    
    func saveCurrentUser() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(taylor) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "SavedPerson")
        }
    }
    
    
}
