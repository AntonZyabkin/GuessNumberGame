//
//  ModuleBuilder.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import Foundation
protocol Builder {
    func buildStartViewController() -> StartViewController
}

final class ModuleBuilder {
    init() {
        
    }
}

extension ModuleBuilder: Builder {
    func buildStartViewController() -> StartViewController {
        return StartViewController()
    }
}
