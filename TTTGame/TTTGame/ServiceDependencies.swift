//
//  ServiceDependencies.swift
//  TTTGame
//
//  Created by Yery Castro on 7/9/23.
//

import Foundation
import Factory

extension Container {
    
    var firebaseRepository: Factory<FirebaseRepositoryProtocol> {
        self { FirebaseRepository() }
            .shared
    }
}
