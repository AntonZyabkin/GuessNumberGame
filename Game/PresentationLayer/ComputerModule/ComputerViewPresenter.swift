//
//  ComputerViewPresenter.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import Foundation

protocol ComputerViewPresenterProtocol {
    func moveButtonDidPressed()
    func equelButtonDidPressed()
}

final class ComputerViewPresenter {
    private var moduleBuilder: Builder
    weak var view: ComputerViewControllerProtocol?
    
    init(moduleBuilder: Builder) {
        self.moduleBuilder = moduleBuilder
    }
    
    private func refreshButtons() {
        view?.lessButton.isEnabled = false
        view?.moreButton.isEnabled = false
        view?.equelbutton.isEnabled = false
        view?.lessButton.backgroundColor = .clear
        view?.moreButton.backgroundColor = .clear
        view?.equelbutton.backgroundColor = .clear
    }
}

extension ComputerViewPresenter: ComputerViewPresenterProtocol {
    func moveButtonDidPressed() {
        refreshButtons()
        moduleBuilder.game.computerMove()
        view?.guessLabel.text = "Attempt № \(moduleBuilder.game.aiAttempts) \nComputer is guessing\n\nYour number is: \(moduleBuilder.game.assumptionNumber)?"
        switch moduleBuilder.game.status {
        case .equal:
            view?.equelbutton.backgroundColor = .blue
            view?.equelbutton.isEnabled = true
        case .less:
            view?.lessButton.backgroundColor = .blue
            view?.lessButton.isEnabled = true
        case .more:
            view?.moreButton.backgroundColor = .blue
            view?.moreButton.isEnabled = true
        }
    }
    
    func equelButtonDidPressed() {
        let playerViewController = moduleBuilder.buildPlayerViewController()
        playerViewController.modalPresentationStyle = .fullScreen
        view?.navigationController?.pushViewController(playerViewController, animated: false)
    }
}
