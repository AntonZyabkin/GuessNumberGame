//
//  GuessNumberViewController.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import UIKit

protocol GuessNumberViewControllerProtocol {
    
}
class GuessNumberViewController: UIViewController {
    var builder: Builder?
    var factory: FactoryProtocol!
    var presenter: GuessNumberViewPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}


extension GuessNumberViewController: GuessNumberViewControllerProtocol {
    
}
