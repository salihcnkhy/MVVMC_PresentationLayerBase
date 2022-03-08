//
//  BaseViewController.swift
//  
//
//  Created by Salihcan Kahya on 15.02.2022.
//

import UIKit

open class BaseViewController<ViewModel, Router, Presenter>: UIViewController {
    
    public var viewModel: ViewModel!
    public var router: Router!
    public var presenter: Presenter!
    
    public convenience init(viewModel: ViewModel, router: Router, presenter: Presenter) {
        self.init()
        self.viewModel = viewModel
        self.router = router
        self.presenter = presenter
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        startViewController()
    }
    
    public override func willMove(toParent parent: UIViewController?) {
        if parent == nil {
            endViewController()
            if let router = router as? RouterProtocol {
                router.dissmiss()
            }
        }
    }
    
    open func startViewController() { }
    open func endViewController() { }
}
