//
//  KeyboardStateListener.swift
//  Mixer
//
//  Created by Neftali Samarey on 4/29/22.
//

import UIKit

class KeyboardStateListener {
    static let shared = KeyboardStateListener()
    var isVisible: Bool = false

    func start() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(handleHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc
    func handleShow() {
        isVisible = true
    }

    @objc
    func handleHide() {
        isVisible = false
    }

    func stop() {
        NotificationCenter.default.removeObserver(self)
    }
}
