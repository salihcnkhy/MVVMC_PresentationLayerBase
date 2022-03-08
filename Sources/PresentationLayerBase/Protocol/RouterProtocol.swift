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
    func dissmiss()
}


public extension RouterProtocol {
    func push(with destinationCoordinator: CoordinatorProtocol) {
    }
    
    func present() {
        
    }
    
    func pop() {
        
    }
}
