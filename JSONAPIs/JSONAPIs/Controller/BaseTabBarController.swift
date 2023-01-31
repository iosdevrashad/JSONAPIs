//
//  BaseTabBarController.swift
//  JSONAPIs
//
//  Created by Rashad Surratt on 1/26/23.
//

import UIKit

class BaseTabBarController: UITabBarController {
    // introuduce apps search controller.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .systemPurple
        tabBar.barTintColor = .systemGray5
       

        viewControllers = [
            createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
            createNavController(viewController: AppSearchController(), title: "Search", imageName: "search"),
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        
        return navController
    }
}
