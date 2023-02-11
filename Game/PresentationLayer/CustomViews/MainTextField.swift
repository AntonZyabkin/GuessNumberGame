//
//  MainTextField.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import UIKit

class MainTextField: UITextField {
    var isValid: Bool
    
    init(placeholderText: String) {
        isValid = false
        super.init(frame: .zero)
        self.placeholder = placeholderText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
