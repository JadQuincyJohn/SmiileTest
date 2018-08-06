//
//  SignUpVC.swift
//  SmiileTest
//
//  Created by Jad  on 06/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol SignUpVCDelegate: class {
	func signUpVCDidDismiss()
	func signUpVCDidRegister()
	func signUpVCDidTapSignIn()
}

class SignUpVC: UIViewController {

	let viewModel = SignUpVCViewModel()
	private let disposeBag = DisposeBag()

	weak var delegate: SignUpVCDelegate?

	@IBOutlet weak var goToSignInButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
		setupGoToSignInButton()
		setupBarButtonItems()
    }

	func setupGoToSignInButton() {
		goToSignInButton.customizeAsFilled(title: viewModel.signInButtonTitle)
		goToSignInButton.rx.tap
			.subscribe(onNext: { [unowned self] in
				self.delegate?.signUpVCDidTapSignIn()
			}).disposed(by: disposeBag)
	}

	func setupBarButtonItems() {

		let dismissButton = UIButton.button(title: viewModel.dismissButtonTitle,
											titleColor: viewModel.dismissButtonTitleColor)
		dismissButton.rx.tap
			.subscribe(onNext: { [unowned self] in
				self.delegate?.signUpVCDidDismiss()
			}).disposed(by: disposeBag)
		navigationItem.setRightBarButton(UIBarButtonItem(customView: dismissButton), animated: true)
	}
}
