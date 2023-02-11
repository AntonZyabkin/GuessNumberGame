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
    func createTextView(withPlaceholder: String) -> UITextField
}

final class Factory: FactoryProtocol {
    func createBlueButton(withTitle: String) -> UIButton {
        let button = UIButton(frame: .zero)
        button.setTitle(withTitle, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        return button
    }
    
    func createTextView(withPlaceholder: String) -> UITextField {
        let textfield = MainTextField(placeholderText: withPlaceholder)
        textfield.layer.cornerRadius = 15
        return textfield
    }
    
}
