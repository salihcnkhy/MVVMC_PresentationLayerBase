//
//  AppRouterProtocol.swift
//  
//
//  Created by Salihcan Kahya on 16.03.2022.
//

import UIKit

public protocol AppRouterProtocol: BaseRouter {
    var window: UIWindow? { get set }
    func setRootCoordinator(_ rootCoordinator: CoordinatorProtocol)
    func setWindow(_ window: UIWindow)
}

public extension AppRouterProtocol {
    func setWindow(_ window: UIWindow) {
        self.window = window
        self.window?.makeKeyAndVisible()
    }
    
    func setRootCoordinator(_ rootCoordinator: CoordinatorProtocol) {
        guard let window = window else { fatalError("Please setWindow at the beginning of application") }
        
        guard let viewController = rootCoordinator.viewController else { fatalError("rootCoordinator ViewController was nil") }
        
        let navigationViewController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationViewController
    }
}
