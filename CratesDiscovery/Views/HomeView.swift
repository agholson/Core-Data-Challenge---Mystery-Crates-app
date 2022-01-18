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
    @StateObject private var model = ListCratesViewModel()
    
    var body: some View {
        // Display any crates, if there are any
        if model.crates.count > 0 {
            Text("Crates available")
        }
        // Else show the login form
        else {
            Text("Crates unavailable")
        }
        
    }
    
}
