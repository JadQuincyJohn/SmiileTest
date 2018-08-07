//
//  SearchViewController.swift
//  SmiileTest
//
//  Created by Jad  on 06/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
		imageView.image = #imageLiteral(resourceName: "searchVC")
		navigationController?.setNavigationBarHidden(true, animated: false)
	}
}

