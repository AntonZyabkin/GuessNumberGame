//
//  GameController.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import Foundation

protocol GameControllerProtocol {
    var guessNumber: Int { get set }
    var AIAttempt: Int { get set }
    var assumptionNumber: Int { get }
    var status: MoveResult { get }
    func computerMove()
    func playerMove(number: Int)
}

final class GameController {
    private var leftEnd = 0
    private var rightEnd = 100
    var assumptionNumber = 0
    var AIAttempt = 0
    var guessNumber = 0
    var status: MoveResult = .outOfRange
    
    private func play() {
        AIAttempt += 1
        status = checkNumber(assumptionNumber)
        print(status)
        switch checkNumber(assumptionNumber) {
        case .equal:
            break
        case .less:
            rightEnd = assumptionNumber
        case.more:
            leftEnd = assumptionNumber
        case .outOfRange:
            break
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
            return .outOfRange
        }
    }
}

extension GameController: GameControllerProtocol {
    func playerMove(number: Int) {
        assumptionNumber = number
        play()
    }
    func computerMove() {
        assumptionNumber = Int.random(in: (leftEnd + 1)..<rightEnd)
        play()
    }
}

enum MoveResult  {
    case less
    case equal
    case more
    case outOfRange
}
