//
//  UIColor+ST.swift
//  SmiileTest
//
//  Created by Jad  on 06/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit

extension UIColor {

	struct Brand {
		static let blue = UIColor(red: 73, green: 170, blue: 212)
		static let yellow = UIColor(red: 250, green: 221, blue: 75)
		static let orange = UIColor(red: 230, green: 146, blue: 62)
	}

	struct Actions {
		static let positive = UIColor(hex: 0x2ecc71)
	}
}

extension UIColor {

	convenience init(red: Int, green: Int, blue: Int) {
		assert(red >= 0 && red <= 255, "Invalid red")
		assert(green >= 0 && green <= 255, "Invalid green")
		assert(blue >= 0 && blue <= 255, "Invalid blue")

		self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
	}

	convenience init(hex:Int) {
		self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
	}
}

