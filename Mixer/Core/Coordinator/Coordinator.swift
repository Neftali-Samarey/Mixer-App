//
//  Coordinator.swift
//  Mixer
//
//  Created by Neftali Samarey on 4/4/22.
//

import UIKit

public protocol Coordinator {

    var childCoordinators: [Coordinator] { get set }
    var rootController: UIViewController { get set }

    func start()

    func push<T: UIViewController>(_ controllerType: T.Type, animated: Bool, completion: StandardCompletion?)
    func push(_ controller: UIViewController, animated: Bool, completion: StandardCompletion?)
    func pushRoot<T: UIViewController>(_ controllerType: T.Type, completion: StandardCompletion?)
    func pushRoot(_ controller: UIViewController, completion: StandardCompletion?)
    func present<T: UIViewController>(_ controllerType: T.Type, animated: Bool, completion: StandardCompletion?)
    func present(_ controller: UIViewController, animated: Bool, completion: StandardCompletion?)
}
