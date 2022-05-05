//
//  ViewController.swift
//  Mixer
//
//  Created by Neftali Samarey on 4/3/22.
//

import UIKit

class ViewController: UIViewController {

    private let beginOnboardingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Onboard", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(invokeOnboardingProcess), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.addSubview(beginOnboardingButton)

        beginOnboardingButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100).isActive = true
        beginOnboardingButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        beginOnboardingButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        beginOnboardingButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    @objc
    func invokeOnboardingProcess() {
        let viewController = LoginViewController()
        viewController.modalPresentationStyle = .fullScreen

        self.present(viewController, animated: true, completion: nil)
    }


    // MARK: - Configure this image on startup for now (temp)
    func showLoginScreen() {
        let viewController = LoginViewController()

        self.present(viewController, animated: true, completion: nil)
    }
}

