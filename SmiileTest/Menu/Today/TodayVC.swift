//
//  TodayVC.swift
//  SmiileTest
//
//  Created by Jad  on 07/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit
import RxGesture
import RxSwift

class TodayVC: UIViewController {

	@IBOutlet weak var imageView: UIImageView!

	private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
		setupProfileBarButtonItem()
		navigationController?.navigationBar.customizeAsBranded()
		imageView.image = #imageLiteral(resourceName: "todayVC")
    }

	func setupProfileBarButtonItem() {
		let profileShortcutView = ProfileShortcutView.viewFromNib
		profileShortcutView.rx
			.tapGesture()
			.when(.recognized)
			.subscribe(onNext: { [unowned self] _ in
				self.showProfile()
			})
			.disposed(by: disposeBag)
		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileShortcutView)
	}

	func showProfile() {
		let profileVC: MockVC = UIViewController.instanciate(storyBoardName: "Main")
		profileVC.viewModel = MockVCViewModel(image: #imageLiteral(resourceName: "profileVC"), title: "Mon compte")
		navigationController?.present(UINavigationController(rootViewController: profileVC), animated: true)
	}
}
