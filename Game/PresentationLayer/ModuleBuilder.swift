//
//  ModuleBuilder.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import Foundation
protocol Builder {
    func buildStartViewController() -> StartViewController
    func buildGuessNumberViewController() -> GuessNumberViewController
}

final class ModuleBuilder {
    var factory: Factory
    init(factory: Factory) {
        self.factory = factory
    }
}

extension ModuleBuilder: Builder {
    
    func buildStartViewController() -> StartViewController {
        let presenter = StartViewPresenter(moduleBuilder: self)
        let viewController = StartViewController()
        presenter.view = viewController
        viewController.presenter = presenter
        viewController.factory = factory
        return viewController
    }
    
    func buildGuessNumberViewController() -> GuessNumberViewController {
        let presenter = GuessNumberViewPresenter(moduleBuilder: self)
        let viewController = GuessNumberViewController()
        presenter.view = viewController
        viewController.presenter = presenter
        viewController.factory = factory
        return viewController
    }
}
