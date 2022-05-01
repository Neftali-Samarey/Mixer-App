//
//  MainCoordinator.swift
//  Mixer
//
//  Created by Neftali Samarey on 4/4/22.
//

import UIKit

public class MainCoordinator: NavigationCoordinator {

    public override init(_ rootController: UIViewController) {
        super.init(rootController)
    }

    public override func start() {
        super.start()
    }

    // MARK: - Root
    func transitionRootTabBar(completion: StandardCompletion? = nil) {
        // pushRoot(TabBarController.self)

        completion?()

    }
}
