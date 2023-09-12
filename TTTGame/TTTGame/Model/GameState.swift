//
//  GameState.swift
//  TTTGame
//
//  Created by Yery Castro on 6/9/23.
//

import Foundation

enum GameState {
    case finished, draw, waitingForPlayer, quit
    
    var name: String {
        switch self {
            
        case .finished:
            return AppStrings.gameHasFinished
        case .draw:
            return AppStrings.draw
        case .waitingForPlayer:
            return AppStrings.waitingForPlayer
        case .quit:
            return AppStrings.online
        }
    }
}
