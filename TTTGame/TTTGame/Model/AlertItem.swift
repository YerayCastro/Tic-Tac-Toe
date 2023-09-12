//
//  AlertItem.swift
//  TTTGame
//
//  Created by Yery Castro on 6/9/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
    
    init(title: String, message: String, buttonTitle: String = AppStrings.rematch) {
        self.title = Text(title)
        self.message = Text(message)
        self.buttonTitle = Text(buttonTitle)
    }
}
