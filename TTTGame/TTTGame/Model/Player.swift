//
//  Player.swift
//  TTTGame
//
//  Created by Yery Castro on 5/9/23.
//

import Foundation

enum Player: Codable {
    
    case player1, player2, cpu
    
    var name: String {
        switch self {
        case .player1:
            return AppStrings.player1
        case .player2:
            return AppStrings.player2
        case .cpu:
            return AppStrings.computer
        }
    }
}
