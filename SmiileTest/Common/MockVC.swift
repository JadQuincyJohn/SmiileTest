//
//  MockVC.swift
//  SmiileTest
//
//  Created by Jad  on 07/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit
import RxSwift


struct MockVCViewModel {
	let image: UIImage
	let title: String
}

class MockVC: UIViewController {

	@IBOutlet weak var imageView: UIImageView!

	private let disposeBag = DisposeBag()

	var viewModel: MockVCViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
		setupBarButtonItems()
		navigationController?.navigationBar.customizeAsBranded()
		title = viewModel.title
		imageView.image = viewModel.image
    }

	func setupBarButtonItems() {

		let dismissButton = UIButton.button(title: "Fermer",
											titleColor: UIColor.Brand.orange)
		dismissButton.rx.tap
			.subscribe(onNext: { [unowned self] in
				self.dismiss(animated: true)
			}).disposed(by: disposeBag)
		navigationItem.setRightBarButton(UIBarButtonItem(customView: dismissButton), animated: true)
	}
}
