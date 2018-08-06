//
//  UIViewController+ST.swift
//  SmiileTest
//
//  Created by Jad  on 06/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit

extension UIViewController {

	static func instanciate<T>(storyBoardName: String = String(describing: T.self) ) -> T {
		let storyBoard = UIStoryboard.init(name: storyBoardName, bundle: nil)
		let viewController = storyBoard.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
		return viewController
	}


}

