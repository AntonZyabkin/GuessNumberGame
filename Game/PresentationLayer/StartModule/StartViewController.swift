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
    private lazy var gameNameLabel: UILabel = {
        let label = UILabel()
        label.text = "My Awesome Game"
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonDidPressed), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configViews()
    }
    
    @objc func buttonDidPressed() {
        presenter?.buttonDidPressed()
    }
    
    private func configViews() {
        view.addSubview(button)
        view.addSubview(gameNameLabel)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            gameNameLabel.heightAnchor.constraint(equalToConstant: 50),
            gameNameLabel.widthAnchor.constraint(equalToConstant: 300),
            gameNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            gameNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        button.translatesAutoresizingMaskIntoConstraints = false
        gameNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension StartViewController: StartViewControllerProtocol {
    
}
