//
//  GameController.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import Foundation

protocol GameControllerProtocol {
    var guessNumber: Int { get set }
    var aiAttempts: Int { get set }
    var playerAttempts: Int { get set }
    var assumptionNumber: Int { get }
    var status: MoveResult { get }
    func computerMove()
    func playerMove(number: Int)
    func aiGuessNumber()
}

final class GameController {
    private var leftEnd = 0
    private var rightEnd = 100
    var assumptionNumber = 0
    var aiAttempts = 0
    var playerAttempts = 0
    var guessNumber = 0
    var status: MoveResult = .equal
    
    private func play() {
        aiAttempts += 1
        status = checkNumber(assumptionNumber)
        switch checkNumber(assumptionNumber) {
        case .equal:
            break
        case .less:
            rightEnd = assumptionNumber
        case.more:
            leftEnd = assumptionNumber
        }
    }

    private func checkNumber(_ number: Int) -> MoveResult {
        switch number {
        case guessNumber:
            return .equal
        case leftEnd..<guessNumber:
            return .more
        case (guessNumber + 1)...rightEnd:
            return .less
        default:
            return .equal
        }
    }
}

extension GameController: GameControllerProtocol {
    func playerMove(number: Int) {
        playerAttempts += 1
        assumptionNumber = number
        status = checkNumber(number)
    }
    func computerMove() {
        assumptionNumber = Int.random(in: (leftEnd + 1)..<rightEnd)
        play()
    }
    func aiGuessNumber() {
        guessNumber = Int.random(in: 1...100)
    }
}

enum MoveResult  {
    case less
    case equal
    case more
}
