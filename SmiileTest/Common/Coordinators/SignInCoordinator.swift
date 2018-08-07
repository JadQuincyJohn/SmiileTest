//
//  SignInCoordinator.swift
//  SmiileTest
//
//  Created by Jad  on 06/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit

protocol SignInCoordinatorDelegate: class {
	func signInVCDidTapSignUp(coordinator: SignInCoordinator)
	func signInVCDidAuthenticate(coordinator: SignInCoordinator)
}

class SignInCoordinator: Coordinator {

	var childCoordinators: [Coordinator] = []

	let presenter: UIViewController
	let navigationController: UINavigationController
	let animated: Bool

	weak var delegate: SignInCoordinatorDelegate?

	init(presenter: UIViewController, animated: Bool) {
		self.presenter = presenter
		navigationController = UINavigationController()
		self.animated = animated
	}

	func start() {
		let signInVC: SignInVC = UIViewController.instanciate(storyBoardName: "Main")
		signInVC.delegate = self
		navigationController.viewControllers = [signInVC]
		presenter.present(navigationController, animated: animated)
	}
}

extension SignInCoordinator: SignInVCDelegate {
	func signInVCDidTapSignUp() {
		presenter.dismiss(animated: false)
		let coordinator = SignUpCoordinator(presenter: presenter, animated: false)
		coordinator.start()
		coordinator.delegate = self
		addChildCoordinator(coordinator)
	}

	func signInVCDidDismiss() {
		presenter.dismiss(animated: true)
	}

	func signInVCDidAuthenticate() {
		presenter.dismiss(animated: true)
		delegate?.signInVCDidAuthenticate(coordinator: self)
	}
}

extension SignInCoordinator: SignUpCoordinatorDelegate {
	func signUpVCDidRegister(coordinator: SignUpCoordinator) {
		presenter.dismiss(animated: true)
		removeChildCoordinator(coordinator)
	}

	func signUpVCDidTapSignIn(coordinator: SignUpCoordinator) {
		presenter.dismiss(animated: true)
		removeChildCoordinator(coordinator)
	}
}
