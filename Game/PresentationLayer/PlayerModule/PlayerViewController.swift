//
//  PlayerViewController.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import UIKit

protocol PlayerViewControllerProtocol: UIViewController {
    
}
final class PlayerViewController: GuessNumberViewController {
    lazy var guessLabel: UILabel = {
        let label = UILabel()
        label.text = "You are guessing"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    lazy var answerLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func configViews() {
        view.addSubview(button)
        view.addSubview(guessLabel)
        view.addSubview(textField)
        view.addSubview(answerLabel)
        
        NSLayoutConstraint.activate([
            guessLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            guessLabel.widthAnchor.constraint(equalToConstant: 300),
            guessLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            guessLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 300),
            textField.topAnchor.constraint(lessThanOrEqualTo: guessLabel.bottomAnchor, constant: 30),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.topAnchor.constraint(lessThanOrEqualTo: textField.bottomAnchor, constant: 30),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            answerLabel.heightAnchor.constraint(equalToConstant: 50),
            answerLabel.widthAnchor.constraint(equalToConstant: 300),
            answerLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 30),
            answerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        guessLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension PlayerViewController: PlayerViewControllerProtocol {}
