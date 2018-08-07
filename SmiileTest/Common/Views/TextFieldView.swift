//
//  TextFieldView.swift
//  SmiileTest
//
//  Created by Jad  on 06/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit

struct TextFieldViewViewModel {
	let title: String
	let placeholder: String?
	let isSecure: Bool

	init(title: String, placeholder: String? = nil, isSecure: Bool = false) {
		self.title = title
		self.placeholder = placeholder
		self.isSecure = isSecure
	}
}

final class TextFieldView: UIView, Nibable {

	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var separatorView: UIView!

	var viewModel: TextFieldViewViewModel!

	override func awakeFromNib() {
		super.awakeFromNib()
		label.font = UIFont.systemFont(ofSize: 18)
		label.textColor = UIColor.darkGray
		textField.font = UIFont.systemFont(ofSize: 16)
		textField.textColor = UIColor.Brand.blue
		textField.borderStyle = .none
		separatorView.backgroundColor = UIColor.Brand.blue
	}

	func configure(viewModel: TextFieldViewViewModel) {
		self.viewModel = viewModel

		textField.isSecureTextEntry = viewModel.isSecure
		textField.placeholder = viewModel.placeholder
		label.text = viewModel.title
	}

	override var intrinsicContentSize: CGSize {
		return CGSize(width: 200, height: 80)
	}
}
