//
//  OnboardingVC.swift
//  SmiileTest
//
//  Created by Jad  on 06/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit
import paper_onboarding
import RxSwift
import RxCocoa

protocol OnboardingVCDelegate: class {
	func onboardingVCDidTapSignInButton()
	func onboardingVCDidTapSignUpButton()
}

class OnboardingVC: UIViewController {

	private let disposeBag = DisposeBag()
	private var viewModel = OnboardingVCViewModel()

	private lazy var onboardingView: PaperOnboarding = {
		let onboardingView = PaperOnboarding(pageViewBottomConstant: viewModel.pageViewBottomConstant + 30)
		onboardingView.dataSource = self
		onboardingView.delegate = self
		return onboardingView
	}()

	private let actionView = ActionView.viewFromNib

	weak var delegate: OnboardingVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
		setupOnboardingView()
		setupNavigationBar()
		setupBindings()
    }

	func setupOnboardingView() {
		view.embed(view: onboardingView, inset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
	}

	func setupBarButtonItems() {

		if viewModel.currentStepIndex.value == 2 {
			navigationItem.rightBarButtonItem = nil
			showActionView()
		}
		else {
			hideActionView()
		}
	}

	func setupNavigationBar() {
		navigationController?.navigationBar.customizeAsTranslucent()
	}

	func setupBindings() {
		viewModel.currentStepIndex
			.asDriver()
			.drive(onNext: { (value) in
				self.setupBarButtonItems()
			}).disposed(by: disposeBag)
	}

	func showActionView() {
		if actionView.superview == nil {
			view.embed(view: actionView, inset: UIEdgeInsets(top: view.bounds.size.height - viewModel.pageViewBottomConstant,
															 left: 0,
															 bottom: 0,
															 right: 0))
			setupSignInButton()
			setupSignUpButton()
		}
		actionView.fadeIn()
	}

	func hideActionView() {
		actionView.fadeOut()
	}

	func setupSignInButton() {
		actionView.button1.customizeAsEmpty(title: viewModel.signInTitle)
		actionView.button1.rx.tap
			.subscribe(onNext: { [unowned self] in
				self.delegate?.onboardingVCDidTapSignInButton()
			}).disposed(by: disposeBag)
	}

	func setupSignUpButton() {
		actionView.button2.customizeAsFilled(title: viewModel.signUpTitle)
		actionView.button2.rx.tap
			.subscribe(onNext: { [unowned self] in
				self.delegate?.onboardingVCDidTapSignUpButton()
			}).disposed(by: disposeBag)
	}
}

extension OnboardingVC: PaperOnboardingDataSource {

	func onboardingItemsCount() -> Int {
		return viewModel.items.count
	}

	func onboardingItem(at index: Int) -> OnboardingItemInfo {
		return viewModel.items[index]
	}
}

extension OnboardingVC: PaperOnboardingDelegate {

	func onboardingWillTransitonToIndex(_ index: Int) {
		viewModel.currentStepIndex.value = index
	}
	
	var enableTapsOnPageControl: Bool {
		return true
	}
}
