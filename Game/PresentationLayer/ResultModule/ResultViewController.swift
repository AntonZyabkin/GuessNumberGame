//
//  ResultViewController.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import UIKit

protocol ResultViewControllerProtocol: UIViewController {
    var scoreLabel: UILabel { get set }
    var winnerLabel: UILabel { get set }
}
class ResultViewController: UIViewController {
    var factory: FactoryProtocol!
    var presenter: ResultViewPresenterProtocol?

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Scores:"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "w"
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    lazy var winnerLabel: UILabel = {
        let label = UILabel()
        label.text = "w"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    private lazy var stackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [titleLabel, scoreLabel, winnerLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.backgroundColor = .clear
        return stack
    }()
    lazy var mainMenuButton = factory.createBlueButton(withTitle: "Main menu")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        view.backgroundColor = .white
        presenter?.showResult()
        mainMenuButton.addTarget(self, action: #selector(mainMenuButtonDidPressed), for: .touchUpInside)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configViews()
    }
    func configViews() {
        view.addSubview(stackView)
        view.addSubview(mainMenuButton)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: 100),
            stackView.widthAnchor.constraint(equalToConstant: 300),
            stackView.bottomAnchor.constraint(equalTo: mainMenuButton.bottomAnchor, constant: -70),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainMenuButton.heightAnchor.constraint(equalToConstant: 50),
            mainMenuButton.widthAnchor.constraint(equalToConstant: 300),
            mainMenuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            mainMenuButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        mainMenuButton.translatesAutoresizingMaskIntoConstraints = false
    }
    @objc func mainMenuButtonDidPressed() {
        presenter?.mainMenuButtonDidPressed()
    }
}

extension ResultViewController: ResultViewControllerProtocol {
    
}
