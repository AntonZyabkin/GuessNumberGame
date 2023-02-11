//
//  PlayerViewPresenter.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import Foundation

protocol PlayerViewPrecenterProtocol: GuessNumberViewPresenterProtocol{
    func startGame()
}
final class PlayerViewPrecenter {
    private var moduleBuilder: Builder
    weak var view: PlayerViewController?

    init(moduleBuilder: Builder) {
        self.moduleBuilder = moduleBuilder
    }
    private func disableButton() {
        view?.button.alpha = 0.5
        view?.button.isEnabled = false
    }
    private func goToResultViewController() {
        let buildResultViewController = moduleBuilder.buildResultViewController()
        buildResultViewController.modalPresentationStyle = .fullScreen
        view?.navigationController?.pushViewController(buildResultViewController, animated: false)
    }
}

extension PlayerViewPrecenter: PlayerViewPrecenterProtocol {
    func startGame() {
        moduleBuilder.game.aiGuessNumber()
    }
    
    func editingChanged(text: String?) {
        guard let number = Int(text ?? "") else {
            disableButton()
            return
        }
        if number > 0 && number <= 100 {
            view?.button.alpha = 1
            view?.button.backgroundColor = .systemBlue
            view?.button.isEnabled = true
        } else {
            disableButton()
        }
    }

    func buttonDidPressed() {
        guard let number = Int(view?.textField.text ?? "") else { return }
        moduleBuilder.game.playerMove(number: number)
        view?.answerLabel.text = ""
        view?.guessLabel.text = "Attempt № \(moduleBuilder.game.playerAttempts) \nYou are guessing?"
        switch moduleBuilder.game.status {
        case .equal:
            view?.answerLabel.text = "Yes! You guessed it!"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.goToResultViewController()
            }
        case .less:
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.view?.answerLabel.text = "No, my number is less than yours"
            }
        case .more:
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.view?.answerLabel.text = "No, my number is more than yours"
            }
        }
    }
}
