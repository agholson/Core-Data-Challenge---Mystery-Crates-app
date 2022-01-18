//
//  CratesDiscoveryApp.swift
//  CratesDiscovery
//
//  Created by Leone on 1/16/22.
//

import SwiftUI

@main
struct CratesDiscoveryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
         
        }
    }
}
