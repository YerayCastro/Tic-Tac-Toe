//
//  TTTGameApp.swift
//  TTTGame
//
//  Created by Yery Castro on 4/9/23.
//

import SwiftUI
import Firebase

@main
struct TTTGameApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
