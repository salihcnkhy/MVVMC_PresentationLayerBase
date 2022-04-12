//
//  RouterProtocol+.swift
//  
//
//  Created by Salihcan Kahya on 12.04.2022.
//

import Foundation
import UIKit

public extension RouterProtocol {
    
    func dissmiss() {
        // dissmiss coordinator from it's parent
        coordinator?.didDissmiss()
    }
    
    func push(with destinationCoordinator: CoordinatorProtocol, animated: Bool = true) {
        
        // start next coordinator
        coordinator?.start(with: destinationCoordinator)
        
        // check next viewController is allocated
        guard let viewController = destinationCoordinator.viewController else { fatalError("destinationCoordinator was nil") }
        
        // push next viewController
        coordinator?.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func present(with destinationCoordinator: CoordinatorProtocol, presentationStyle: UIModalPresentationStyle = .custom, transitionStyle: UIModalTransitionStyle = .coverVertical, completion: (() -> Void)? = nil, animated: Bool = true) {
        
        // start next coordinator
        coordinator?.start(with: destinationCoordinator)
        
        // check next viewController is allocated
        guard let viewController = destinationCoordinator.viewController else { fatalError("destinationCoordinator was nil") }
        
        // set next viewController modal options
        viewController.modalPresentationStyle = presentationStyle
        viewController.modalTransitionStyle = transitionStyle
        
        // wrapped next viewController with UINavigationView for navigationView.present function
        let navigationController = UINavigationController(rootViewController: viewController)
        
        // present next viewController with wrapper UINavigationViewController
        coordinator?.navigationController?.present(navigationController, animated: animated, completion: completion)
    }
    
    func pop(animeted: Bool = true) {
        // try to popViewController either current viewController is nil or not
        coordinator?.viewController?.navigationController?.popViewController(animated: animeted)
    }
}
