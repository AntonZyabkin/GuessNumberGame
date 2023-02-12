//
//  ResultViewPresenter.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import Foundation
protocol ResultViewPresenterProtocol {
    func showResult()
    func mainMenuButtonDidPressed()
}

final class ResultViewPresenter {
    private var moduleBuilder: Builder
    weak var view: ResultViewControllerProtocol?
    
    init(moduleBuilder: Builder) {
        self.moduleBuilder = moduleBuilder
    }
}

extension ResultViewPresenter: ResultViewPresenterProtocol{
    func showResult() {
        view?.scoreLabel.text = "Your's tries count: \(moduleBuilder.game.playerAttempts)\nComputers's tries count: \(moduleBuilder.game.aiAttempts)"
        switch moduleBuilder.game.aiAttempts - moduleBuilder.game.playerAttempts {
        case 0:
            view?.winnerLabel.text = "Fixed draw"
        case ..<0 :
            view?.winnerLabel.text = "Computer won"
        case 1... :
            view?.winnerLabel.text = "You won"
        default:
            break
        }
    }
    func mainMenuButtonDidPressed() {
        moduleBuilder.game = GameController()
        view?.navigationController?.popToRootViewController(animated: true)
    }
}
