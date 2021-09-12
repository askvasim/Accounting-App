//
//  SwinjectStoryboard.swift
//  Accounting App
//
//  Created by Vasim Khan on 9/8/21.
//

import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    class func setup() {
        let swinject = defaultContainer
        
        swinject.register(HomeNetworkProtocol.self, name: "HomeNetworkProtocol") { r in
            HomeNetworkHandler()
        }.inObjectScope(.container)

        swinject.storyboardInitCompleted(HomeViewController.self) { resolvable, viewController in
            viewController.homeNetworkProtocol = resolvable.resolve(HomeNetworkProtocol.self, name: "HomeNetworkProtocol")
        }
        
        swinject.storyboardInitCompleted(TransactionViewController.self) { resolvable, viewController in
            viewController.transections = resolvable.resolve(HomeNetworkProtocol.self, name: "HomeNetworkProtocol")
        }
        
    }
    
}
