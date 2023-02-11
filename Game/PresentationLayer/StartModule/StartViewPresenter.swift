//
//  StartViewPresenter.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import Foundation
import UIKit


protocol StartViewPresenterProtocol {
    func startGameButtonDidPressed() -> UIViewController
    func buttonDidPressed()
}
final class StartViewPresenter {
    private let moduleBuilder: Builder

    weak var view: StartViewControllerProtocol?
    init(moduleBuilder: Builder) {
        self.moduleBuilder = moduleBuilder
    }
}

extension StartViewPresenter: StartViewPresenterProtocol {
    func startGameButtonDidPressed() -> UIViewController {
        return moduleBuilder.buildGuessNumberViewController()
    }
    func buttonDidPressed() {
        let guessViewController = moduleBuilder.buildGuessNumberViewController()
        guessViewController.modalPresentationStyle = .fullScreen
        view?.navigationController?.pushViewController(guessViewController, animated: true)
    }
//    func buttonDidPressed() {
//        let playerViewController = moduleBuilder.buildPlayerViewController()
//        playerViewController.modalPresentationStyle = .fullScreen
//        view?.navigationController?.pushViewController(playerViewController, animated: false)
//    }
//    func buttonDidPressed() {
//        let playerViewController = moduleBuilder.buildResultViewController()
//        playerViewController.modalPresentationStyle = .fullScreen
//        view?.navigationController?.pushViewController(playerViewController, animated: false)
//    }

}
