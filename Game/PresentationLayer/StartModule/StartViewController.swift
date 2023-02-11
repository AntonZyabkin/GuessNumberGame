//
//  ViewController.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import UIKit

protocol StartViewControllerProtocol {}

class StartViewController: UIViewController {
    var builder: Builder?
    var factory: FactoryProtocol!
    var presenter: StartViewPresenterProtocol?
    
    private lazy var button = factory.createBlueButton(withTitle: "Start New Game")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        button.addTarget(self, action: #selector(buttonDidPress), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configViews()
    }
    
    @objc func buttonDidPress() {
        let guessViewController = presenter?.startGameButtonDidPressed() ?? UIViewController()
        guessViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(guessViewController, animated: false)
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
