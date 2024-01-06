//
//  SplashViewController.swift
//  instagram
//
//  Created by Heba Omar94 on 06/12/2023.
//

import UIKit
import FirebaseAuth

class SplashViewController: UIViewController {
    
    init() {
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if Auth.auth().currentUser != nil {
                self.presentHome()
            } else {
                self.presentSignIn()
            }
        }
    }
    
    private func presentSignIn() {
        let vc = SignInViewController()
        let nav = AppNavController(rootViewController: vc)
        RootRouter.presentRootScreen(with: nav)
    }
    
    private func presentHome() {
        let tabBar = AppTabBarController()
        RootRouter.presentRootScreen(with: tabBar)
    }
}
