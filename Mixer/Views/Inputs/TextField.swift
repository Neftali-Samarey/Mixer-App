//
//  TextField.swift
//  Mixer
//
//  Created by Neftali Samarey on 4/28/22.
//

import UIKit

class TextField: UITextField {

    public var placeholderText: String? {
        get { return placeholder }
        set { placeholder = newValue }
    }

    public var fieldBorderStyle: BorderStyle {
        get { return borderStyle }
        set { borderStyle = newValue }
    }

    public var fieldBackgroundColor: UIColor? {
        get { return backgroundColor ?? .white }
        set { backgroundColor = newValue }
    }

    public var fieldBorderColor: CGColor? {
        get { return layer.borderColor ?? UIColor.clear.cgColor }
        set { layer.borderColor = newValue }
    }

    public var fieldCornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }

    public var fieldBorderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }

    public var fieldType: UIKeyboardType {
        get { return keyboardType }
        set { keyboardType = newValue }
    }

    public var fieldIsSecure: Bool {
        get { return isSecureTextEntry }
        set { return isSecureTextEntry = newValue }
    }

    // MARK: - Initializers
    init() {
        super.init(frame: .zero)

        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - Overrides

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10))
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10))
    }
}
