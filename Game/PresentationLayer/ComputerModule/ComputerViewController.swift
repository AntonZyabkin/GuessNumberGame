//
//  ComputerViewController.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import UIKit

protocol ComputerViewControllerProtocol: UIViewController {
    
}
class ComputerViewController: UIViewController {
    var presenter: ComputerViewPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        view.backgroundColor = .white
    }
}

extension ComputerViewController: ComputerViewControllerProtocol {
    
}
