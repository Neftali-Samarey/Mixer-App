//
//  OnboardingViewModel.swift
//  Mixer
//
//  Created by Neftali Samarey on 4/27/22.
//

import UIKit

public class GlobalConstants {
    static var onboardingScene: [OnboardingModel] {
        var scenes: [OnboardingModel] = []
        scenes.append(OnboardingModel(title: "Scene 1", description: "Some description for scene 1"))
        scenes.append(OnboardingModel(title: "Scene 2", description: "Some description for scene 2"))
        scenes.append(OnboardingModel(title: "Scene 3", description: "Some additional description for scene 3"))

        return scenes
    }
}

class OnboardingViewModel {

    func createControllerPages(fromIndex: Int) -> UIViewController {
        let screen = GlobalConstants.onboardingScene[fromIndex]
        let viewController = OnboardingViewController()

        return viewController
    }

}
