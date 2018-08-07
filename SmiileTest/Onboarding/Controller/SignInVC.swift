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
	@IBOutlet weak var fieldsStackView: UIStackView!
	@IBOutlet weak var facebookButtonContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
		setupView()
		setupBarButtonItems()
		setupNavigationBar()
		setupSignUpButton()
		setupForm()
		setupFacebookButton()
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
		goToSignUpButton.customizeAsEmpty(title: viewModel.signUpButtonTitle)
		goToSignUpButton.rx.tap
			.subscribe(onNext: { [unowned self] in
				self.delegate?.signInVCDidTapSignUp()
			}).disposed(by: disposeBag)
	}

	func setupNavigationBar() {
		self.navigationController?.setNavigationBarHidden(false, animated: false)
		navigationController?.navigationBar.customizeAsTranslucent()
	}

	func setupView() {
		title = viewModel.title
		view.backgroundColor = .white
	}

	func setupFacebookButton() {
		let facebookButton = UIButton.imageButton(image: #imageLiteral(resourceName: "facebook"))
		facebookButton.rx.tap
			.subscribe(onNext: { [unowned self] in
				self.delegate?.signInVCDidAuthenticate()
			}).disposed(by: disposeBag)

		fieldsStackView.addArrangedSubview(facebookButton)
		facebookButtonContainer.embed(view: facebookButton)
	}

	func setupForm() {
		let loginField = TextFieldView.viewFromNib
		loginField.configure(viewModel: TextFieldViewViewModel(title: "Identifiant Smiile", placeholder: "alex@voodoo.io"))
		let passwordField = TextFieldView.viewFromNib
		passwordField.configure(viewModel: TextFieldViewViewModel(title: "Mot de passe", placeholder: "aPassw@rd1!!", isSecure: true))

		fieldsStackView.addArrangedSubview(loginField)
		fieldsStackView.addArrangedSubview(passwordField)

		let validationButton = FormButton(type: .custom)
		validationButton.customizeAsFilled(title: "Valider")
		validationButton.rx.tap
			.subscribe(onNext: { [unowned self] in
				self.delegate?.signInVCDidAuthenticate()
			}).disposed(by: disposeBag)
		fieldsStackView.addArrangedSubview(validationButton)

		let separatorView = SeparatorView.viewFromNib
		separatorView.configure(viewModel: SeparatorViewViewModel(separatorColor: .clear, title: "Ou Facebook Connect"))
		fieldsStackView.addArrangedSubview(separatorView)
	}
}
