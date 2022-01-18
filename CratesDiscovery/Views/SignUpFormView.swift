//
//  SignUpView.swift
//  CratesDiscovery
//
//  Created by Leone on 1/17/22.
//

import SwiftUI

struct SignUpFormView: View {
    
    @State private var name: String = ""
    
    var body: some View {
        
        Form {
            // Divides the email + password from the rest of the form
            Section {
                TextField("Email", text: $name)
            }
            
            // Sign in button
            Button {
                // User hits sign in here, which launches our Firebase code
                // TODO: Add create account data
                
            } label: {
                HStack {
                    Spacer()
                    Text("Sign in")
                    Spacer()
                }
            }
        }
        .navigationTitle("Sign up")
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFormView()
    }
}
