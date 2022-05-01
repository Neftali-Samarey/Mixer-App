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
    var imageViewOpacity: Float?

    var isKeyboardRaised: Bool = false

    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.layer.opacity = 0.0

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
        guard var imageViewOpacity = imageViewOpacity else {
            return
        }

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

//    @objc
//    func animateBackgroundImage() {
//        self.centerYLayoutConstrain?.isActive = false
//
//        UIView.animate(withDuration: 0.3) {
//            self.centerYLayoutConstrain?.constant = 0
//            self.centerYLayoutConstrain?.isActive = true
//            self.view.layoutIfNeeded()
//        }
//    }

    private func configureFieldsView() {
        view.addSubview(stackView)

        stackView.heightAnchor.constraint(equalToConstant: 125).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: view.bounds.width - 20).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        fieldCenterYaLayoutConstrain = stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        fieldBottomLayoutConstrain = stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150)
        fieldBottomLayoutConstrain?.isActive = true
        // stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true
    }


    private func configureImageView() {
        guard let image = UIImage(named: "LoginScreenBackground") else {
            return
        }

        self.view.addSubview(self.imageView)
        self.imageView.image = image


        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseIn) {
            self.imageView.layer.opacity = 1.0
            self.imageViewOpacity = self.imageView.layer.opacity

            self.centerYLayoutConstrain = self.imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            /// self.imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
            self.imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
            self.imageView.heightAnchor.constraint(equalToConstant: self.view.bounds.height / 2).isActive = true
            self.centerYLayoutConstrain?.isActive = false

        } completion: { done in
            if done {
                self.centerYLayoutConstrain?.constant = -100
                self.centerYLayoutConstrain?.isActive = true
            }
        }

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
        if !isKeyboardRaised {
            fieldCenterYaLayoutConstrain?.isActive = false

            UIView.animate(withDuration: 0.3) {
                self.fieldBottomLayoutConstrain?.constant = -150
                self.fieldBottomLayoutConstrain?.isActive = true
                self.view.layoutIfNeeded()
            }
        }
    }
}
