//
//  BaseCoordinator.swift
//  
//
//  Created by Salihcan Kahya on 15.02.2022.
//

import Foundation
import UIKit

open class BaseCoordinator<ViewModel, Router, Presenter>: CoordinatorProtocol {
    public weak var parent: CoordinatorProtocol?
    public let id = UUID()
    
    public var viewController: UIViewController!
    public var childs = [CoordinatorProtocol]()
    
    public var viewModel: ViewModel
    public var router: Router
    public var presenter: Presenter
    
    public init(viewModel: ViewModel, router: Router, presenter: Presenter) {
        self.viewModel = viewModel
        self.router = router
        self.presenter = presenter
    }
    
    public var navigationController: UINavigationController? {
        viewController.navigationController
    }
    
    open func start() { fatalError("implement start method") }
    
    public func start(with destinationCoordinator: CoordinatorProtocol) {
        destinationCoordinator.parent = self
        childs.append(destinationCoordinator)
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
