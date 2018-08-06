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
	let navigationController: UINavigationController

	weak var delegate: SignUpCoordinatorDelegate?

	init(presenter: UIViewController) {
		self.presenter = presenter
		navigationController = UINavigationController()
	}

	func start() {
		let signUpVC: SignUpVC = UIViewController.instanciate(storyBoardName: "Main")
		signUpVC.delegate = self
		navigationController.viewControllers = [signUpVC]
		presenter.present(navigationController, animated: true)
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
		presenter.dismiss(animated: true)
	}
}
