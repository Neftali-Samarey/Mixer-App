//
//  MixerOnboardingViewController.swift
//  Mixer
//
//  Created by Neftali Samarey on 4/26/22.
//

import UIKit

class MixerOnboardingViewController: UIPageViewController {

    var viewModel = OnboardingViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPageControl()

        delegate = self
        dataSource = self

        setViewControllers([viewModel.createControllerPages(fromIndex: 0)], direction: .forward, animated: true)
    }

    func setupPageControl(){
        UIPageControl.appearance(whenContainedInInstancesOf: [MixerOnboardingViewController.self]).currentPageIndicatorTintColor = UIColor.red
        UIPageControl.appearance(whenContainedInInstancesOf: [MixerOnboardingViewController.self]).pageIndicatorTintColor = UIColor.blue
    }
}


extension MixerOnboardingViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return GlobalConstants.onboardingScene.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        var index: Int = 0
        for (location, _) in GlobalConstants.onboardingScene.enumerated() {
            if let vc = pageViewController.children.first as? MixerOnboardingViewController {
                index = location
            }
        }

        return index
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
}
