//
//  ComputerViewPresenter.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import Foundation

protocol ComputerViewPresenterProtocol {
    
}

final class ComputerViewPresenter {
    private var moduleBuilder: Builder
    weak var view: ComputerViewControllerProtocol?
    
    init(moduleBuilder: Builder) {
        self.moduleBuilder = moduleBuilder
    }

}

extension ComputerViewPresenter: ComputerViewPresenterProtocol {
    
}
