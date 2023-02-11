//
//  ViewController.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import UIKit

protocol StartViewControllerProtocol: UIViewController {}

class StartViewController: UIViewController {
    var factory: FactoryProtocol!
    var presenter: StartViewPresenterProtocol?
    
    private lazy var button = factory.createBlueButton(withTitle: "Start New Game")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonDidPress), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configViews()
    }
    
    @objc func buttonDidPress() {
        presenter?.buttonDidPress()
    }
    
    private func configViews() {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        button.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension StartViewController: StartViewControllerProtocol {
    
}
