//
//  ProfileShortcutView.swift
//  SmiileTest
//
//  Created by Jad  on 07/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit

final class ProfileShortcutView: UIView, Nibable {

	@IBOutlet weak var label: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		label.text = "Jad John"
		label.textColor = .white
	}
}
