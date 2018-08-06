//
//  SignInVC.swift
//  SmiileTest
//
//  Created by Jad  on 06/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

protocol SignInVCDelegate: class {
	func signInVCDidDismiss()
	func signInVCDidAuthenticate()
	func signInVCDidTapSignUp()
}

class SignInVC: UIViewController {

	private let disposeBag = DisposeBag()
	let viewModel = SignInVCViewModel()

	weak var delegate: SignInVCDelegate?

	@IBOutlet weak var goToSignUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
		setupView()
		setupBarButtonItems()
		setupNavigationBar()
		setupSignUpButton()
    }

	func setupBarButtonItems() {

		let dismissButton = UIButton.button(title: viewModel.dismissButtonTitle,
											titleColor: viewModel.dismissButtonTitleColor)
		dismissButton.rx.tap
			.subscribe(onNext: { [unowned self] in
				self.delegate?.signInVCDidDismiss()
			}).disposed(by: disposeBag)
		navigationItem.setRightBarButton(UIBarButtonItem(customView: dismissButton), animated: true)
	}

	func setupSignUpButton() {
		goToSignUpButton.customizeAsFilled(title: viewModel.signUpButtonTitle)
		goToSignUpButton.rx.tap
			.subscribe(onNext: { [unowned self] in
				self.delegate?.signInVCDidTapSignUp()
			}).disposed(by: disposeBag)
	}

	func setupNavigationBar() {
		self.navigationController?.setNavigationBarHidden(false, animated: false)
	}

	func setupView() {
		view.backgroundColor = UIColor.Brand.blue
	}
}
