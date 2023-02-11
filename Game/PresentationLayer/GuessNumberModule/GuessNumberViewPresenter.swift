//
//  GuessNumberViewPresenter.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import Foundation
import UIKit

protocol GuessNumberViewPresenterProtocol {
    func editingChanged (text: String?) -> Void
    func buttonDidPressed()
}

final class GuessNumberViewPresenter {
    private var moduleBuilder: Builder

    weak var view: GuessNumberViewControllerProtocol?
    init(moduleBuilder: Builder) {
        self.moduleBuilder = moduleBuilder
    }
    private func disableButton() {
        view?.button.alpha = 0.5
        view?.button.isEnabled = false
    }

}

extension GuessNumberViewPresenter: GuessNumberViewPresenterProtocol {
    
    func editingChanged(text: String?) {
        guard let number = Int(text ?? "") else {
            disableButton()
            return
        }
        if number > 0 && number <= 100 {
            moduleBuilder.game.guessNumber = number
            view?.button.alpha = 1
            view?.button.backgroundColor = .systemBlue
            view?.button.isEnabled = true
        } else {
            disableButton()
        }
    }
    func buttonDidPressed() {
        let computerViewController = moduleBuilder.buildComputerViewController()
        computerViewController.modalPresentationStyle = .fullScreen
        view?.navigationController?.pushViewController(computerViewController, animated: true)
    }

}
