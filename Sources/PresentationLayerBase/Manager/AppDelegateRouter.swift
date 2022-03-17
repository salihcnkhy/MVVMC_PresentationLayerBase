//
//  AppDelegateRouter.swift
//  
//
//  Created by Salihcan Kahya on 16.02.2022.
//

import Foundation
import UIKit

public final class AppDelegateRouter: BaseRouter {
    
    private var _window: UIWindow?
    
    private var window: UIWindow {
        get {
            if _window == nil {
                _window = UIWindow(frame: UIScreen.main.bounds)
            }
            
            return _window!
        }
    }
    
    func setRoot(with rootCoordinator: CoordinatorProtocol) {
        window.rootViewController = rootCoordinator.navigationController
        window.makeKeyAndVisible()
    }
}
