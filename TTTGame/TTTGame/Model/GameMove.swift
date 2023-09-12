//
//  GameMove.swift
//  TTTGame
//
//  Created by Yery Castro on 5/9/23.
//

import Foundation

struct GameMove: Codable {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        player == .player1 ? "xmark" : "circle"
    }
}
