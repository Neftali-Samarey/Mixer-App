//
//  LoginEmailTextField.swift
//  Mixer
//
//  Created by Neftali Samarey on 4/29/22.
//

import UIKit

class LoginEmailTextField: TextField {

    override init() {
        super.init()

        self.placeholderText = "Enter your email"
        self.fieldBackgroundColor = .white
        self.fieldBorderColor = UIColor.lightGray.cgColor
        self.fieldCornerRadius = 8
        self.fieldBorderWidth = 1
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

