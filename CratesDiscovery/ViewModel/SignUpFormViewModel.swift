//
//  SignUpViewModel.swift
//  CratesDiscovery
//
//  Created by Leone on 1/17/22.
//

import Foundation
import Combine

/*
 The View Model for the sign up form
 */
class SignUpFormViewModel: ObservableObject {
    // Adds the new user to the Core Data database
    func addUser(name: String) {
        UserStorage.shared.add(name: name)
    }

}
