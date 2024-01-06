//
//  AppTabBarController.swift
//  instagram
//
//  Created by Heba Omar94 on 06/12/2023.
//

import UIKit
import IBAnimatable

class AppTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //comfigure UI
        //color/size any customization we will implement it here
    }
    //here we will present our screen
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //appear screen or item
        //navigationcontroller in home
        
        let itemHome = AppNavController(rootViewController: HomeViewController())
        
        // another item
        //navigation in profile
        let itemProfile = AppNavController(rootViewController: ProfileViewController())
        
    //add items
        let tabHome = UITabBarItem(title: "Home", image: UIImage(named: "Home"), selectedImage: nil)
        let tabProfile = UITabBarItem(title: "profile", image: UIImage(named: "profile"), selectedImage: nil)
        //let tabStore = UITabBarItem(title: "store", image: UIImage(named: "store"), selectedImage: nil)
        
        //linked item with tabbar
        itemHome.tabBarItem = tabHome
        itemProfile.tabBarItem = tabProfile
        
        viewControllers = [itemHome,itemProfile]
        
    }
}
