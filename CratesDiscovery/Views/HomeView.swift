//
//  ContentView.swift
//  CratesDiscovery
//
//  Created by Leone on 1/16/22.
//

import SwiftUI
import CoreData

/*
 Displays any crates the person uses, if the user was logged in
 */
struct HomeView: View {
    // Initializes the list crates view model here
    @StateObject private var model = HomeViewViewModel()
    
    var body: some View {
        // Display any crates, if there are any
        if model.loggedIn == true {
            VStack {
                Text("Welcome \(model.user.name!)")
                
                Button {
                    // MARK: - Reset App
                    model.resetTheApp()
                    
                } label: {
                    Text("Sign out and delete account.")
                }
                
            }
            
        }
        // Else show the login form
        else {
            SignUpFormView()
        }
        
    }
    
}
