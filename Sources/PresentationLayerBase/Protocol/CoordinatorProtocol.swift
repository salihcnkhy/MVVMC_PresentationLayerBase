//
//  CoordinatorProtocol.swift
//  
//
//  Created by Salihcan Kahya on 15.02.2022.
//

import Foundation
import UIKit

public protocol CoordinatorProtocol: AnyObject {
    var parent: CoordinatorProtocol? { get set }
    var id: UUID { get }
    var navigationController: UINavigationController! { get set }
    
    func start()
    func start(with destinationCoordinator: CoordinatorProtocol)
    func didDissmiss()
    func removeChild(with coordinator: CoordinatorProtocol)
}
