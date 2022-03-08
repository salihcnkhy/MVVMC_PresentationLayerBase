//
//  CoordinatorProtocol.swift
//  
//
//  Created by Salihcan Kahya on 15.02.2022.
//

import Foundation

public protocol CoordinatorProtocol: AnyObject {
    var parent: CoordinatorProtocol? { get set }
    var id: UUID { get }
    func start()
    func start(with destinationCoordinator: CoordinatorProtocol)
    func didDissmiss()
    func removeChild(with coordinator: CoordinatorProtocol)
}
