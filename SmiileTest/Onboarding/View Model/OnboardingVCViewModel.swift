//
//  OnboardingVCViewModel.swift
//  SmiileTest
//
//  Created by Jad  on 06/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import Foundation
import paper_onboarding
import RxSwift

enum OnboardingStep: Int {
	case share = 0, trust, security

	var title: String {
		switch self {
		case .share:
			return "Partage"
		case .trust:
			return "Confiance"
		case .security:
			return "Sécurité"
		}
	}

	var description: String {
		switch self {
		case .share:
			return "Vous allez adorer partager avec vos voisins : objets, services, actualités... "
		case .trust:
			return "Rejoignez un réseau de plus \n400 000 voisins !"
		case .security:
			return "Un réseau bienveillant et sécurisé avec la Maif"
		}
	}

	var color: UIColor {
		switch self {
		case .share:
			return UIColor.Brand.blue
		case .trust:
			return UIColor.Brand.yellow
		case .security:
			return UIColor.Brand.orange
		}
	}

	var image: UIImage {
		switch self {
		case .share:
			return #imageLiteral(resourceName: "share")
		case .trust:
			return #imageLiteral(resourceName: "confiance")
		case .security:
			return #imageLiteral(resourceName: "maif")
		}
	}

	var icon: UIImage {
		switch self {
		case .share:
			return #imageLiteral(resourceName: "share_icon")
		case .trust:
			return #imageLiteral(resourceName: "confiance_icon")
		case .security:
			return #imageLiteral(resourceName: "security_icon")
		}
	}
}

struct OnboardingVCViewModel {

	private let titleFont = UIFont.boldSystemFont(ofSize: 32)
	private let steps: [OnboardingStep] = [.share, .trust, .security]

	var currentStepIndex = Variable<Int>(0)

	let signInTitle = "Connexion"
	let signUpTitle = "Je m'inscris"
	let dismissButtonTitleColor = UIColor.Brand.orange
	let startButtonTitleColor = UIColor.Actions.positive
	let pageViewBottomConstant: CGFloat = 120

	lazy var items: [OnboardingItemInfo] = {

		var items: [OnboardingItemInfo] = []
		steps.forEach {

			let stepInfo = OnboardingItemInfo(informationImage: $0.image,
							   title: $0.title,
							   description: $0.description,
							   pageIcon: $0.icon,
							   color: $0.color,
							   titleColor: .white,
							   descriptionColor: .white,
							   titleFont: titleFont,
							   descriptionFont: UIFont.systemFont(ofSize: 18))
			items.append(stepInfo)
		}
		return items
	}()
}
