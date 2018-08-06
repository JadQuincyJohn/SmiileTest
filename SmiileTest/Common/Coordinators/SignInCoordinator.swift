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

	weak var delegate: SignInCoordinatorDelegate?

	init(presenter: UIViewController) {
		self.presenter = presenter
		navigationController = UINavigationController()
	}

	func start() {
		let signInVC: SignInVC = UIViewController.instanciate(storyBoardName: "Main")
		signInVC.delegate = self
		navigationController.viewControllers = [signInVC]
		presenter.present(navigationController, animated: true)
	}
}

extension SignInCoordinator: SignInVCDelegate {
	func signInVCDidTapSignUp() {
		presenter.dismiss(animated: true)
		delegate?.signInVCDidTapSignUp(coordinator: self)
	}

	func signInVCDidDismiss() {
		presenter.dismiss(animated: true)
	}

	func signInVCDidAuthenticate() {
		presenter.dismiss(animated: true)
		delegate?.signInVCDidAuthenticate(coordinator: self)
	}
}
