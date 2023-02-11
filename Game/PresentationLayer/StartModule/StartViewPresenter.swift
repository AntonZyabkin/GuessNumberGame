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
}
final class StartViewPresenter {
    private let moduleBuilder: Builder

    var view: StartViewControllerProtocol?
    init(moduleBuilder: Builder) {
        self.moduleBuilder = moduleBuilder
    }
}

extension StartViewPresenter: StartViewPresenterProtocol {
    func startGameButtonDidPressed() -> UIViewController {
        return moduleBuilder.buildGuessNumberViewController()
    }
}
