//
//  UIView+ST.swift
//  SmiileTest
//
//  Created by Jad  on 06/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit

extension UIView {

	func embed(view: UIView, inset: UIEdgeInsets = .zero ) {

		view.translatesAutoresizingMaskIntoConstraints = false
		addSubview(view)

		let metrics = [
			"topMargin" : inset.top,
			"bottomMargin" : inset.bottom,
			"leftMargin" : inset.left,
			"rightMargin" : inset.right,
			]

		let bindings = ["subview": view]

		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(topMargin)-[subview]-(bottomMargin@999)-|",
													  options: [],
													  metrics: metrics,
													  views: bindings))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(leftMargin)-[subview]-(rightMargin)-|",
													  options: [],
													  metrics: metrics,
													  views: bindings))
	}

	func fadeIn(_ duration: TimeInterval = 0.4, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
		UIView.animate(withDuration: duration,
					   delay: delay,
					   options: UIViewAnimationOptions.curveEaseIn,
					   animations: {
						self.alpha = 1.0
		},
					   completion: completion)
	}

	func fadeOut(_ duration: TimeInterval = 0.4, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
		UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
			self.alpha = 0.0
		}, completion: completion)
	}
}
