//
//  TTTGameTests.swift
//  TTTGameTests
//
//  Created by Yery Castro on 4/9/23.
//

import XCTest
@testable import TTTGame

final class TTTGameTests: XCTestCase {

    let sut = GameViewModel(with: .vsHuman, onlineRepository: OnlineGameRepository())
    
    func test_ResetGameSetsTheActivePlayerToPlayer1() {
        sut.resetGame()
        XCTAssertEqual(sut.activePlayer, .player1)
        
    }
    
    func test_ResetGameSetsMovesToNineNilObjects() {
        sut.resetGame()
        XCTAssertEqual(sut.moves.count, 9)
    }
    
    func test_ResetGameSetsGameNotificationToP1Turn() {
        sut.resetGame()
        XCTAssertEqual(sut.gameNotification, " It's \(sut.activePlayer.name)'s move ")
    }
    
    func test_ProccesMovesWillShowFinishAlert() {
        for index in 0..<9 {
            sut.processMove(for: index)
        }
        
        XCTAssertEqual(sut.gameNotification, AppStrings.gameHasFinished)
    }

}
