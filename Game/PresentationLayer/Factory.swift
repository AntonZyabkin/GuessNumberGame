//
//  Factory.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import Foundation
import UIKit


protocol FactoryProtocol {
    func createBlueButton(withTitle: String) -> UIButton
    func createSquareButton(withTitle: String) -> UIButton
    func createTextField(withPlaceholder: String) -> UITextField
}

final class Factory: FactoryProtocol {
    func createBlueButton(withTitle: String) -> UIButton {
        let button = UIButton(frame: .zero)
        button.setTitle(withTitle, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        return button
    }
    func createSquareButton(withTitle: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setTitle(withTitle, for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.systemGray, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.cornerRadius = 15
        return button
    }
    func createTextField(withPlaceholder: String) -> UITextField {
        let textfield = UITextField()
        textfield.placeholder = withPlaceholder
        textfield.keyboardType = .numberPad
        textfield.layer.cornerRadius = 15
        textfield.textAlignment = .center
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.systemGray4.cgColor
        return textfield
    }
}
