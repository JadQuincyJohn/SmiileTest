//
//  SeparatorView.swift
//  SmiileTest
//
//  Created by Jad  on 07/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit

struct SeparatorViewViewModel {
	let separatorColor: UIColor
	let title: String
}
final class SeparatorView: UIView, Nibable {

	@IBOutlet weak var separatorView: UIView!
	@IBOutlet weak var separatorLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
	}

	func configure(viewModel: SeparatorViewViewModel) {
		separatorView.backgroundColor = viewModel.separatorColor
		separatorLabel.text = viewModel.title
	}

}
