//
//  RootRouter.swift
//  instagram
//
//  Created by Heba Omar94 on 06/12/2023.
//

import UIKit

class RootRouter {
    
    static func presentRootScreen(with root: UIViewController) {
        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        window?.makeKeyAndVisible()
        window?.rootViewController = root
    }
}
