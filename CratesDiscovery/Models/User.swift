//
//  User.swift
//  CratesDiscovery
//
//  Created by Leone on 1/16/22.
//

import Foundation


/*
 Use the Codable protocol as well, so that we can convert back/ forth into JSON used in
 the Core Data Default role
 */
struct User: Identifiable, Codable {
    
    var id = UUID()
    
}
