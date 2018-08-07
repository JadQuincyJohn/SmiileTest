//
//  OffersVC.swift
//  SmiileTest
//
//  Created by Jad  on 07/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit
import RxSwift

class OffersVC: UIViewController {

	private let disposeBag = DisposeBag()

	@IBOutlet weak var imageView: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
		imageView.image = #imageLiteral(resourceName: "offersVC")
		view.backgroundColor = UIColor.Brand.blue
		navigationController?.navigationBar.customizeAsBranded()

		let image = #imageLiteral(resourceName: "add").withRenderingMode(.alwaysTemplate)
		let editButton = UIButton.imageButton(image: image)
		editButton.rx.tap
			.subscribe(onNext: { [unowned self] in
				self.showEdition()
			}).disposed(by: disposeBag)
		editButton.tintColor = .white

		navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: editButton)
	}

	func showEdition() {
		let editionVC: MockVC = UIViewController.instanciate(storyBoardName: "Main")
		editionVC.viewModel = MockVCViewModel(image: #imageLiteral(resourceName: "edtionVC"), title: "Mon compte")
		navigationController?.present(UINavigationController(rootViewController: editionVC), animated: true)
	}
}
