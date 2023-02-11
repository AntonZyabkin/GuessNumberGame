//
//  GuessNumberViewPresenter.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import Foundation

protocol GuessNumberViewPresenterProtocol {
    
}

final class GuessNumberViewPresenter {
    private let moduleBuilder: Builder

    var view: GuessNumberViewControllerProtocol?
    init(moduleBuilder: Builder) {
        self.moduleBuilder = moduleBuilder
    }

}

extension GuessNumberViewPresenter: GuessNumberViewPresenterProtocol {
    
}
