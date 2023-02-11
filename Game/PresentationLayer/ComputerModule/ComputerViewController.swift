//
//  ComputerViewController.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import UIKit

protocol ComputerViewControllerProtocol: UIViewController {
    var guessLabel: UILabel { get set }
    var lessButton: UIButton { get set }
    var equelbutton: UIButton { get set }
    var moreButton: UIButton { get set }
}
class ComputerViewController: UIViewController {
    var presenter: ComputerViewPresenterProtocol?
    var factory: FactoryProtocol!
    
    lazy var guessLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    lazy var lessButton = factory.createSquareButton(withTitle: "<")
    lazy var equelbutton = factory.createSquareButton(withTitle: "=")
    lazy var moreButton = factory.createSquareButton(withTitle: ">")
    
    private lazy var myNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "My number is ..."
        return label
    }()
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [moreButton, equelbutton, lessButton])
        stackView.axis = .horizontal
        stackView.backgroundColor = .red
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        presenter?.moveButtonDidPressed()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configViews()
    }
    
    private func configViews() {
        
        view.addSubview(guessLabel)
        view.addSubview(myNumberLabel)
        view.addSubview(hStackView)
        NSLayoutConstraint.activate([
            
            guessLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            guessLabel.widthAnchor.constraint(equalToConstant: 300),
            guessLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            guessLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            myNumberLabel.heightAnchor.constraint(equalToConstant: 50),
            myNumberLabel.widthAnchor.constraint(equalToConstant: 300),
            myNumberLabel.bottomAnchor.constraint(equalTo: hStackView.topAnchor, constant: -5),
            myNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            hStackView.heightAnchor.constraint(equalToConstant: 90),
            hStackView.widthAnchor.constraint(equalToConstant: 300),
            hStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            hStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        guessLabel.translatesAutoresizingMaskIntoConstraints = false
        myNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        
        moreButton.addTarget(self, action: #selector(moveButtonDidPressed), for: .touchUpInside)
        lessButton.addTarget(self, action: #selector(moveButtonDidPressed), for: .touchUpInside)
        equelbutton.addTarget(self, action: #selector(equelButtonDidPress), for: .touchUpInside)
    }
    
    @objc func moveButtonDidPressed() {
        presenter?.moveButtonDidPressed()
    }
    
    @objc func equelButtonDidPress() {
        presenter?.equelButtonDidPressed()
    }
}

extension ComputerViewController: ComputerViewControllerProtocol {
}
