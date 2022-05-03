//
//  LoginHeaderLabel.swift
//  Mixer
//
//  Created by Neftali Samarey on 4/28/22.
//

import UIKit

class LoginHeaderLabel: Label {

    override init() {
        super.init()

        initialize()

        text = "Log In or Sign Up to get started:"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialize() {
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont(name: "Inter-SemiBold", size: 16.0)
    }
}
