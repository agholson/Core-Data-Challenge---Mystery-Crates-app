//
//  SignUpViewModel.swift
//  CratesDiscovery
//
//  Created by Leone on 1/17/22.
//

import Foundation
import Combine

class SignUpFormViewModel {
    // Adds the new user to the Core Data database
    func addUser(name: String) {
        UserStorage.shared.add(name: name)
    }

}
