//
//  ListCratesViewModel.swift
//  CratesDiscovery
//
//  Created by Leone on 1/17/22.
//

import Foundation
import Combine

class ListCratesViewModel: ObservableObject {
    
    @Published var crates: [Crate] = []
    
    private var cancellable: AnyCancellable?
    
    init(cratePublisher: AnyPublisher<[Crate], Never> = CrateStorage.shared.crates.eraseToAnyPublisher()) {
        cancellable = cratePublisher.sink { [unowned self] crates in
            print("Updating crates line 19 ListCratesViewModel")
            self.crates = crates
            print("Crates line 21 in ListCratesViewModel \(crates)")
        }
    }
   
}
