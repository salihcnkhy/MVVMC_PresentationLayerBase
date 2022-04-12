//
//  RouterProtocol.swift
//  
//
//  Created by Salihcan Kahya on 15.02.2022.
//

import Foundation
import Combine
import UIKit

public protocol RouterProtocol {
    var coordinator: CoordinatorProtocol? { get }
    func dissmiss()
    func setCoordinator(_ coordinator: CoordinatorProtocol)
}
