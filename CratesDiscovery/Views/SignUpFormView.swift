//
//  SignUpView.swift
//  CratesDiscovery
//
//  Created by Leone on 1/17/22.
//

import SwiftUI

struct SignUpFormView: View {
    // Tracks the name of the user
    @State private var name: String = ""
    
    @StateObject var model = SignUpFormViewModel()
    
    var body: some View {
        
        VStack {
            
            // MARK: - User Sign Up form
            Form {
                // Divides the email + password from the rest of the form
                Section {
                    TextField("Name", text: $name)
                }
                
                // Sign in button
                Button {
                    // User hits sign in here, which launches our Firebase code
                    // MARK: Create's Account Here
                    model.addUser(name: name)
                    
                } label: {
                    HStack {
                        Spacer()
                        Text("Sign up")
                        Spacer()
                    }
                }
            }
            .navigationTitle("Sign up")
            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFormView()
    }
}
