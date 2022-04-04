//
//  BaseRouter.swift
//  
//
//  Created by Salihcan Kahya on 15.02.2022.
//

import Combine

open class BaseRouter: RouterProtocol {
    private(set) public weak var coordinator: CoordinatorProtocol?
    
    public init() { }
    
    public func setCoordinator(_ coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
}
