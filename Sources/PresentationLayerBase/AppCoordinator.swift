//
//  AppCoordinator.swift
//  
//
//  Created by Salihcan Kahya on 16.03.2022.
//

import UIKit

open class AppCoordinator: BaseCoordinator<AppViewModelProtocol, AppRouterProtocol, AppPresenterProtocol> {
    
    public func setScene(_ scene: UIWindowScene) {
        let window = UIWindow(windowScene: scene)
        router.setWindow(window)
    }
    
    public func setWindow(_ window: UIWindow) {
        router.setWindow(window)
    }
    
    public override func start(with destinationCoordinator: CoordinatorProtocol) {
        super.start(with: destinationCoordinator)
        router.setRootCoordinator(destinationCoordinator)
    }
}
