//
//  RouterProtocol.swift
//  
//
//  Created by Salihcan Kahya on 15.02.2022.
//

import Foundation
import Combine
import UIKit

public protocol RouterProtocol {
    var coordinator: CoordinatorProtocol? { get }
    func dissmiss()
}


public extension RouterProtocol {
    
    func dissmiss() {
        coordinator?.didDissmiss()
    }
    
    func push(with destinationCoordinator: CoordinatorProtocol, animated: Bool = true) {
        coordinator?.start(with: destinationCoordinator, options: [])
        coordinator?.navigationController.pushViewController(destinationCoordinator.viewController!, animated: animated)
    }
    
    func present(with destinationCoordinator: CoordinatorProtocol, presentationStyle: UIModalPresentationStyle = .custom, transitionStyle: UIModalTransitionStyle = .coverVertical, completion: (() -> Void)? = nil, animated: Bool = true) {
        coordinator?.start(with: destinationCoordinator, options: [.passNavigationController])
        destinationCoordinator.viewController?.modalPresentationStyle = presentationStyle
        destinationCoordinator.viewController?.modalTransitionStyle = transitionStyle
        coordinator?.navigationController.present(destinationCoordinator.viewController!, animated: animated, completion: completion)
    }
    
    func pop(animeted: Bool = true) {
        coordinator?.viewController?.navigationController?.popViewController(animated: animeted)
    }
}
