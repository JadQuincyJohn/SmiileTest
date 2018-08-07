//
//  SignUpCoordinator.swift
//  SmiileTest
//
//  Created by Jad  on 06/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit

protocol SignUpCoordinatorDelegate: class {
	func signUpVCDidRegister(coordinator: SignUpCoordinator)
	func signUpVCDidTapSignIn(coordinator: SignUpCoordinator)
}

class SignUpCoordinator: Coordinator {

	var childCoordinators: [Coordinator] = []

	let presenter: UIViewController
	let animated: Bool
	let navigationController: UINavigationController

	weak var delegate: SignUpCoordinatorDelegate?

	init(presenter: UIViewController, animated: Bool) {
		self.presenter = presenter
		navigationController = UINavigationController()
		self.animated = animated
	}

	func start() {
		let signUpVC: SignUpVC = UIViewController.instanciate(storyBoardName: "Main")
		signUpVC.delegate = self
		navigationController.viewControllers = [signUpVC]
		presenter.present(navigationController, animated: animated)
	}
}

extension SignUpCoordinator: SignUpVCDelegate {

	func signUpVCDidDismiss() {
		presenter.dismiss(animated: true)
	}

	func signUpVCDidRegister() {
		presenter.dismiss(animated: true)
	}

	func signUpVCDidTapSignIn() {
		presenter.dismiss(animated: false)
		let coordinator = SignInCoordinator(presenter: presenter, animated: false)
		coordinator.start()
		coordinator.delegate = self
		addChildCoordinator(coordinator)
	}
}

extension SignUpCoordinator: SignInCoordinatorDelegate {
	func signInVCDidTapSignUp(coordinator: SignInCoordinator) {
		presenter.dismiss(animated: true)
		removeChildCoordinator(coordinator)
	}

	func signInVCDidAuthenticate(coordinator: SignInCoordinator) {
		presenter.dismiss(animated: true)
		removeChildCoordinator(coordinator)
	}
}
