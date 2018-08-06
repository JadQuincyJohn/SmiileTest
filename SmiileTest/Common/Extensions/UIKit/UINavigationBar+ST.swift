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
	}
}
