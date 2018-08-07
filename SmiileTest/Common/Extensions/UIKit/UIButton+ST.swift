//
//  UIButton+ST.swift
//  SmiileTest
//
//  Created by Jad  on 06/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit

extension UIButton {

	static func button(title: String, titleColor: UIColor) -> UIButton {
		let button = UIButton(type: .custom)
		button.frame = CGRect(x: 0, y: 0, width: 80, height: 44)
		button.setTitle(title, for: .normal)
		button.setTitleColor(titleColor, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
		return button
	}

	static func imageButton(image: UIImage, size: CGSize = CGSize(width: 44, height: 44)) -> UIButton {
		let imageButton = UIButton(type: .custom)
		imageButton.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
		imageButton.setImage(image, for: .normal)
		return imageButton
	}

	func customizeAsFilled(title: String = "") {
		setTitle(title, for: .normal)
		setTitleColor(UIColor.white, for: .normal)
		customizeAppearance(color: UIColor.Brand.orange)
		titleLabel?.font = UIFont.systemFont(ofSize: 18)
		customizeAsRounded()
	}

	func customizeAsEmpty(title: String) {
		setTitle(title, for: .normal)
		setTitleColor(UIColor.Brand.orange, for: .normal)
		titleLabel?.font = UIFont.systemFont(ofSize: 18)
		customizeAsRounded()
		customizeWithBorder(color: UIColor.Brand.orange)
	}

	private func customizeAppearance(color : UIColor) {
		let normalImage = UIImage(color: color)
		let disabledImage = UIImage(color: color.withAlphaComponent(0.5))
		setBackgroundImage(normalImage, for: .normal)
		setBackgroundImage(disabledImage, for: .disabled)
	}

	func customizeAsRounded() {
		layer.cornerRadius = bounds.height / 2
		layer.masksToBounds = true
	}

	func customizeWithBorder(color: UIColor) {
		layer.borderWidth = 1
		layer.borderColor = color.cgColor
	}
}

