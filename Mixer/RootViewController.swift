//
//  RootViewController.swift
//  Mixer
//
//  Created by Neftali Samarey on 5/3/22.
//

import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        view.backgroundColor = .white

        let dateViewController = ViewController()
        let tabBarItemOne = UITabBarItem(title: nil, image: UIImage(named: "tabBar-selected-martini"), selectedImage: UIImage(named: "tabBar-selected-martini"))

        dateViewController.tabBarItem = tabBarItemOne

        let profileViewController = ProfileViewController()
        let profileViewItem = UITabBarItem(title: nil, image: UIImage(named: "tabBar-unselected-person"), selectedImage: UIImage(named: "tabBar-selected-person"))

        let navigationBar = UINavigationController(rootViewController: profileViewController)
        navigationBar.navigationBar.prefersLargeTitles = true
        // navigationBar.navigationItem.rightBarButtonItem = 
        profileViewController.tabBarItem = profileViewItem

        self.viewControllers = [navigationBar, dateViewController]
    }
}

extension RootViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let title = viewController.title else {
            return
        }

        print("Selected \(title)")
    }
}
