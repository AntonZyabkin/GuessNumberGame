//
//  ModuleBuilder.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

protocol Builder {
    func buildStartViewController() -> StartViewController
    func buildGuessNumberViewController() -> GuessNumberViewController
    func buildComputerViewController() -> ComputerViewController
    var game: GameControllerProtocol { get set }
}

final class ModuleBuilder {
    var factory: Factory
    var game: GameControllerProtocol
    init(factory: Factory, game: GameControllerProtocol) {
        self.factory = factory
        self.game = game
    }
}

extension ModuleBuilder: Builder {
    
    func buildStartViewController() -> StartViewController {
        let presenter = StartViewPresenter(moduleBuilder: self)
        let viewController = StartViewController()
        viewController.factory = factory
        presenter.view = viewController
        viewController.presenter = presenter
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
    
    func buildComputerViewController() -> ComputerViewController {
        let presenter = ComputerViewPresenter(moduleBuilder: self)
        let viewController = ComputerViewController()
        viewController.factory = factory
        presenter.view = viewController
        viewController.presenter = presenter
        return viewController
    }

}
