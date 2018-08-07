//
//  UINavigationBar+ST.swift
//  SmiileTest
//
//  Created by Jad  on 06/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit

extension UINavigationBar {

	func customizeAsTranslucent() {
		setBackgroundImage(UIImage(), for: .default)
		shadowImage = UIImage()
		isTranslucent = true
		self.titleTextAttributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20),
									NSAttributedStringKey.foregroundColor: UIColor.Brand.blue]
	}

	func customizeAsBranded() {
		barTintColor = UIColor.Brand.blue
		isTranslucent = false
		titleTextAttributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20),
							   NSAttributedStringKey.foregroundColor: UIColor.Brand.blue]
	}
}
