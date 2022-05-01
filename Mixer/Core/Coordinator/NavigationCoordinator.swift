//
//  NavigationCoordinator.swift
//  Mixer
//
//  Created by Neftali Samarey on 4/4/22.
//

import UIKit

open class NavigationCoordinator: Coordinator {

    public var childCoordinators: [Coordinator] = []
    public var rootController: UIViewController

    public var rootNavigationController: UINavigationController? {
        if let controller = (rootController as? UITabBarController)?.selectedViewController as? UINavigationController {
            return controller
        }

        if let controller = rootController as? UINavigationController {
            return controller
        }

        return nil
    }

    public var topNavigationController: UINavigationController? {
        var pushingController: UIViewController? = rootController

        while true {
            if let controller = pushingController as? UITabBarController {
                pushingController = controller.selectedViewController
                continue
            }

            if let controller = pushingController as? UINavigationController {
                if let presentedController = controller.viewControllers.last?.presentedViewController {
                    pushingController = presentedController
                    continue
                } else {
                    return pushingController as? UINavigationController
                }
            }

            if let controller = pushingController?.presentedViewController {
                pushingController = controller
                continue
            }

            return pushingController as? UINavigationController
        }
    }

    // MARK: - Initializer

    public init(_ rootController: UIViewController) {
        self.rootController = rootController
    }

    // MARK: - Protocol
    open func start() {
        // Not implemented yet
    }

    public func push<T: UIViewController>(_ controllerType: T.Type, animated: Bool, completion: StandardCompletion? = nil) {
        let vc = T()
        push(vc, animated: animated, completion: completion)
    }

    public func push(_ controller: UIViewController, animated: Bool, completion: StandardCompletion? = nil) {
        guard let topNavigationController = topNavigationController else {
            return
        }

        topNavigationController.pushViewController(controller, animated: animated)

        completion?()
    }

    public func pushRoot<T: UIViewController>(_ controllerType: T.Type, completion: StandardCompletion? = nil) {
        let vc = T()
        pushRoot(vc, completion: completion)
    }

    public func pushRoot(_ controller: UIViewController, completion: StandardCompletion? = nil) {
        if let observer = rootController as? NotificationObservable {
            observer.removeAllObservers()
        }

        rootController = controller

        guard let window = UIApplication.shared.delegate?.window,
            let keyWindow = window else {
                completion?()
                return
        }

        keyWindow.rootViewController = rootController
        keyWindow.makeKeyAndVisible()

        completion?()
    }

    public func present<T: UIViewController>(_ controllerType: T.Type, animated: Bool, completion: StandardCompletion? = nil) {
        let vc = T()
        present(vc, animated: animated, completion: completion)
    }

    public func present(_ controller: UIViewController, animated: Bool, completion: StandardCompletion? = nil) {
        controller.modalPresentationStyle = .fullScreen

        var presentingController = rootController

        while let controller = presentingController.presentedViewController {
            presentingController = controller
        }

        presentingController.present(controller, animated: animated, completion: completion)
    }

    public func dismiss(controller: UIViewController, animated: Bool, completion: StandardCompletion? = nil) {
        controller.dismiss(animated: animated, completion: completion)
    }

    public func dismiss(animated: Bool, completion: StandardCompletion? = nil) {
        var presentingController = rootController

        while let controller = presentingController.presentedViewController {
            presentingController = controller
        }

        dismiss(controller: presentingController, animated: animated, completion: completion)
    }

    public func dismissRoot(animated: Bool, completion: StandardCompletion? = nil) {
        dismiss(controller: rootController, animated: animated, completion: completion)
    }

    public func pop(controller: UINavigationController, animated: Bool, completion: StandardCompletion? = nil) {
        controller.popViewController(animated: animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + (animated ? 0.5 : 0)) {
            completion?()
        }
    }

    public func pop(animated: Bool, completion: StandardCompletion? = nil) {
        guard let topNavigationController = topNavigationController else {
            return
        }

        pop(controller: topNavigationController, animated: animated, completion: completion)
    }

    @discardableResult
    public func popToController<T: UIViewController>(ofClass: T.Type, animated: Bool) -> T? {
        guard let topNavigationController = topNavigationController else {
            return nil
        }

        for controller in topNavigationController.viewControllers.reversed() where controller is T {
            topNavigationController.popToViewController(controller, animated: animated)
            return controller as? T
        }

        return nil
    }

    public func popToRoot(animated: Bool, completion: StandardCompletion? = nil) {
        guard let topNavigationController = topNavigationController else {
            return
        }

        topNavigationController.popToRootViewController(animated: animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + (animated ? 0.5 : 0)) {
            completion?()
        }
    }
}
