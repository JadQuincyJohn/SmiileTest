//
//  Coordinator.swift
//  SmiileTest
//
//  Created by Jad  on 06/08/2018.
//  Copyright © 2018 Jad . All rights reserved.
//

import Foundation


protocol Coordinator: class {
	var childCoordinators: [Coordinator] { get set }
	func start()
}

extension Coordinator {

	func addChildCoordinator(_ childCoordinator: Coordinator) {
		childCoordinators.append(childCoordinator)
	}

	func removeChildCoordinator(_ childCoordinator: Coordinator) {
		childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
	}

	func removeChildrenCoordinators() {
		childCoordinators.removeAll()
	}
}
