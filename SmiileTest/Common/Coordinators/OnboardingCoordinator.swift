//
//  OnboardingCoordinator.swift
//  SmiileTest
//
//  Created by Jad  on 06/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit

protocol OnboardingCoordinatorDelegate: class {
	func onboardingVCDidTapSignInButton(coordinator: OnboardingCoordinator)
	func onboardingVCDidTapSignUpButton(coordinator: OnboardingCoordinator)
}

class OnboardingCoordinator: Coordinator {

	var childCoordinators: [Coordinator] = []
	let navigationController: UINavigationController
	let presenter: UIViewController

	weak var delegate: OnboardingCoordinatorDelegate?

	init(presenter: UIViewController) {
		self.navigationController = UINavigationController()
		self.presenter = presenter
	}

	func start() {
		let onboardingVC = OnboardingVC()
		onboardingVC.delegate = self
		navigationController.viewControllers = [onboardingVC]
		presenter.present(navigationController, animated: false)
	}
}

extension OnboardingCoordinator: OnboardingVCDelegate {
	func onboardingVCDidTapSignInButton() {
		delegate?.onboardingVCDidTapSignInButton(coordinator: self)
	}

	func onboardingVCDidTapSignUpButton() {
		delegate?.onboardingVCDidTapSignUpButton(coordinator: self)
	}
}
