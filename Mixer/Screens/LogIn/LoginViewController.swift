//
//  LoginViewController.swift
//  Mixer
//
//  Created by Neftali Samarey on 4/28/22.
//

import UIKit

class LoginViewController: UIViewController {

    private let stackView = LoginFormStackView()
    var centerYLayoutConstrain: NSLayoutConstraint?
    var fieldCenterYaLayoutConstrain: NSLayoutConstraint?
    var fieldBottomLayoutConstrain: NSLayoutConstraint?

    var isKeyboardRaised: Bool = false

    var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.layer.opacity = 0.0

        configureLogoImageView()
        configureImageView()
        configureFieldsView()

        view.backgroundColor = .white

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapRecognizer)

        NotificationCenter.default.addObserver(self, selector: #selector(handleShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(handleHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc
    private func updateFieldViewLayout() {
        hideBackgroundImage()

        isKeyboardRaised = !isKeyboardRaised

        fieldBottomLayoutConstrain?.isActive = false

        UIView.animate(withDuration: 0.3) {
            self.fieldCenterYaLayoutConstrain?.constant = 0
            self.fieldCenterYaLayoutConstrain?.isActive = true
            self.view.layoutIfNeeded()
        }
    }

    private func reset() {
        if !isKeyboardRaised {
            fieldCenterYaLayoutConstrain?.isActive = false

            UIView.animate(withDuration: 0.3) {
                self.fieldBottomLayoutConstrain?.constant = -150
                self.fieldBottomLayoutConstrain?.isActive = true
                self.view.layoutIfNeeded()
            }
        }
    }

    private func configureFieldsView() {
        view.addSubview(stackView)

        stackView.heightAnchor.constraint(equalToConstant: 125).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: view.bounds.width - 20).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        fieldCenterYaLayoutConstrain = stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        fieldBottomLayoutConstrain = stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150)
        fieldBottomLayoutConstrain?.isActive = true
    }

    private func configureLogoImageView() {
        guard let image = UIImage(named: "LoginScreenLogo") else {
            return
        }

        view.addSubview(logoImageView)
        logoImageView.image = image

        logoImageView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 235).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }


    private func configureImageView() {
        guard let image = UIImage(named: "LoginScreenBackground") else {
            return
        }

        self.view.addSubview(self.imageView)
        self.imageView.image = image


        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseIn) {
            self.imageView.layer.opacity = 1.0

            self.centerYLayoutConstrain = self.imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            self.imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
            self.imageView.heightAnchor.constraint(equalToConstant: self.view.bounds.height / 2).isActive = true
            self.centerYLayoutConstrain?.isActive = false

        } completion: { done in
            if done {
                self.centerYLayoutConstrain?.constant = -100
                self.centerYLayoutConstrain?.isActive = true
            }
        }

        view.bringSubviewToFront(logoImageView)
    }

    @objc
    func handleShow(notification: Notification) {
        updateFieldViewLayout()
    }

    @objc
    func handleHide(notification: Notification) {
        reset()
    }

    @objc
    func hideKeyboard() {
        self.view.endEditing(true)
        lightweightReset()
    }

    private func lightweightReset() {
        isKeyboardRaised = false

        showBackgroundImage()

        if !isKeyboardRaised {
            fieldCenterYaLayoutConstrain?.isActive = false

            UIView.animate(withDuration: 0.3) {
                self.fieldBottomLayoutConstrain?.constant = -150
                self.fieldBottomLayoutConstrain?.isActive = true
                self.view.layoutIfNeeded()
            }
        }
    }

    // MARK: - Animation
    func hideBackgroundImage() {
        UIView.animate(withDuration: 0.4) {
            self.imageView.layer.opacity = 0
        }
    }

    func showBackgroundImage() {
        UIView.animate(withDuration: 0.4) {
            self.imageView.layer.opacity = 1.0
        }
    }
}
