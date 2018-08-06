//
//  Nibable.swift
//  SmiileTest
//
//  Created by Jad  on 06/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import UIKit

protocol Nibable {
	static var viewFromNib: Self { get }
	static var nib: UINib { get }
}

extension Nibable where Self: UIView {
	static var viewFromNib: Self {
		return nib.instantiate(withOwner: self, options: nil).first as! Self
	}

	static var nib: UINib {
		return UINib(nibName: nibName, bundle: nil)
	}

	fileprivate static var nibName: String {
		return NSStringFromClass(self).components(separatedBy: ".").last!
	}
}
