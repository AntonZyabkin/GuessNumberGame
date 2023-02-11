//
//  GuessNumberViewController.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import UIKit

protocol GuessNumberViewControllerProtocol: UIViewController {
    var button: UIButton { get set }
}
class GuessNumberViewController: UIViewController {
    var factory: FactoryProtocol!
    var presenter: GuessNumberViewPresenterProtocol?

    internal lazy var button: UIButton = {
        let button = factory.createBlueButton(withTitle: "Enter the number")
        button.alpha = 0.5
        button.isEnabled = false
        return button
    }()
    private lazy var textField = factory.createTextField(withPlaceholder: "Guess a number from 1 to 100")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)

        view.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonDidPress), for: .touchUpInside)
        textField.addTarget(self, action: #selector(textFielEditingChanged), for: .editingChanged)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configViews()
    }
    
    private func configViews() {
        
        view.addSubview(button)
        view.addSubview(textField)
        NSLayoutConstraint.activate([
            
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 300),
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])
        button.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func buttonDidPress() {
        presenter?.buttonDidPress()
    }
    
    @objc func textFielEditingChanged() {
        presenter?.editingChanged(text: textField.text)
    }

}

extension GuessNumberViewController: GuessNumberViewControllerProtocol {
    
}
