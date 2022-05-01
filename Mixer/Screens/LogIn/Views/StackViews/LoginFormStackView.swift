//
//  LoginFormStackView.swift
//  Mixer
//
//  Created by Neftali Samarey on 4/28/22.
//

import UIKit

class LoginFormStackView: UIStackView {

    private let loginFieldStackLabel = LoginHeaderLabel()
    private let emailField = LoginEmailTextField()
    private let passwordField = LoginPasswordTextField()

    init() {
        super.init(frame: .zero)

        configureStackView()
        initialize()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false

        loginFieldStackLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 45).isActive = true

        addArrangedSubview(loginFieldStackLabel)
        addArrangedSubview(emailField)
        addArrangedSubview(passwordField)
    }

    private func configureStackView() {
        self.spacing = 10
        self.axis = .vertical
        self.distribution = .fill
    }
}
