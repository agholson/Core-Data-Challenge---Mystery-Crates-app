//
//  ListCratesViewModel.swift
//  CratesDiscovery
//
//  Created by Leone on 1/17/22.
//

import Foundation
import Combine

class HomeViewViewModel: ObservableObject {
    
    @Published var crates: [Crate] = []
    
    @Published var user: User = User()
    
    @Published var loggedIn: Bool = false
    
    private var cancellable = Set<AnyCancellable>()
    
    init(
        cratePublisher: AnyPublisher<[Crate], Never> = CrateStorage.shared.crates.eraseToAnyPublisher(),
        userPublisher: AnyPublisher<User, Never> = UserStorage.shared.user.eraseToAnyPublisher()
    ) {
        
        // MARK: - Access Core Data for the Values
        cratePublisher.sink { [unowned self] courses in
            self.crates = crates
        }.store(in: &cancellable)
        
        userPublisher.sink { [unowned self] user in
            self.user = user
        }.store(in: &cancellable)
        
        // Check the person's logged-in status
        checkLogin()
        
    }
    
    // Check login
    func checkLogin() {
        // If the user is not nil
        // If the user's name is set, then the person logged in
        if self.user.name != nil {
            self.loggedIn = true
        }
        // Else the person has not logged in
        else {
            self.loggedIn = false
        }
        
    }
    
    /*
     Deletes the user from the database as well as all of the crates in the database.
     */
    func resetTheApp() {
        
        // Delete the current user
        UserStorage.shared.delete(userToDelete: user)
        
        // Tell the View the person is no longer longed-in
        self.loggedIn = false
        
        // Delete all crates
        
        
    }
    
}
