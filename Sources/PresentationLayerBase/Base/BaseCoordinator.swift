//
//  BaseCoordinator.swift
//  
//
//  Created by Salihcan Kahya on 15.02.2022.
//

import Foundation
import UIKit

open class BaseCoordinator<ViewModel, Router, Presenter>: CoordinatorProtocol {
    public let id = UUID()
    
    public weak var parent: CoordinatorProtocol?
    
    public var childs = [CoordinatorProtocol]()
    
    public var viewModel: ViewModel
    
    public var router: Router
    
    public var presenter: Presenter
    
    public var viewController: UIViewController?
    
    public init(viewModel: ViewModel, router: Router, presenter: Presenter) {
        self.viewModel = viewModel
        self.router = router
        self.presenter = presenter
        
        (router as? RouterProtocol)?.setCoordinator(self)
    }
    
    open func start() { fatalError("implement start method") }
    
    public func start(with destinationCoordinator: CoordinatorProtocol) {
        childs.append(destinationCoordinator)
        destinationCoordinator.parent = self
        destinationCoordinator.start()
    }
    
    public func removeChild(with coordinator: CoordinatorProtocol) {
        childs.removeAll(where: { $0.id == coordinator.id })
    }
    
    public func removeChilds() {
        childs.forEach { $0.didDissmiss() }
    }
    
    public func didDissmiss() {
        parent?.removeChild(with: self)
    }
}
