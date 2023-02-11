//
//  GameController.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import Foundation

protocol GameControllerProtocol {
    var guessNumber: Int { get set }
}

final class GameController {
    var guessNumber: Int = 0
    var leftEnd = 0
    var rightEnd = 100
    
    func checkNumber(_ number: Int) -> Bool {
        switch number {
        case guessNumber:
            return true
        default:
            return false
        }
    }
}

extension GameController: GameControllerProtocol {}
