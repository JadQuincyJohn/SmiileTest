//
//  FormButton.swift
//  SmiileTest
//
//  Created by Jad  on 07/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit

final class FormButton: UIButton {

	override var intrinsicContentSize: CGSize {
		return CGSize(width: UIViewNoIntrinsicMetric, height: 44)
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		customizeAsRounded()
	}


}
