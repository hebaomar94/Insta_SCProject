//
//  AppNavController.swift
//  instagram
//
//  Created by Heba Omar94 on 06/12/2023.
//

import UIKit
// for nav bar
class AppNavController: UINavigationController {
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        //CALL anyfunc
        setupUI()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //incase we decided use it in storyboard
        setupUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //setup ui
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //setup ui
    }
    
    func setupUI() {
        //font
        //NSAttributedString.Key.color/font...
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold)
        ]
    }
}
