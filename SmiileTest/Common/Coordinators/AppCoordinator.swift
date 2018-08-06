//
//  AppCoordinator.swift
//  SmiileTest
//
//  Created by Jad  on 06/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {

	var childCoordinators: [Coordinator] = []
	let window: UIWindow

	lazy var rootViewController: UITabBarController = {
		let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
		let tabVC = storyBoard.instantiateInitialViewController() as! UITabBarController
		return tabVC
	}()

	init(window: UIWindow) {
		self.window = window
	}

	func start() {
		window.rootViewController = rootViewController
		window.makeKeyAndVisible()
		showOnboarding()
	}

	func showOnboarding() {
		let coordinator = OnboardingCoordinator(presenter: rootViewController)
		coordinator.start()
		coordinator.delegate = self
		addChildCoordinator(coordinator)
	}

	func showSignIn(presenter: UIViewController) {
		let coordinator = SignInCoordinator(presenter: presenter)
		coordinator.start()
		coordinator.delegate = self
		addChildCoordinator(coordinator)
	}

	func showSignUp(presenter: UIViewController) {

		let coordinator = SignUpCoordinator(presenter: presenter)
		coordinator.start()
		coordinator.delegate = self
		addChildCoordinator(coordinator)
	}
}

extension AppCoordinator: OnboardingCoordinatorDelegate {
	func onboardingVCDidTapSignInButton(coordinator: OnboardingCoordinator) {
		showSignIn(presenter: coordinator.navigationController)
	}

	func onboardingVCDidTapSignUpButton(coordinator: OnboardingCoordinator) {
		showSignIn(presenter: rootViewController)
	}
}

extension AppCoordinator: SignInCoordinatorDelegate {
	
	func signInVCDidDismiss(coordinator: SignInCoordinator) {
		
	}

	func signInVCDidTapSignUp(coordinator: SignInCoordinator) {
		showSignUp(presenter: rootViewController)
	}

	func signInVCDidAuthenticate(coordinator: SignInCoordinator) {

	}
}

extension AppCoordinator: SignUpCoordinatorDelegate {

	func signUpVCDidRegister(coordinator: SignUpCoordinator) {
		
	}

	func signUpVCDidTapSignIn(coordinator: SignUpCoordinator) {
		showSignUp(presenter: coordinator.navigationController)
	}
}
