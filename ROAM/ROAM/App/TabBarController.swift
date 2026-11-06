//
//  TabBarController.swift
//  ROAM
//
//  Created by Khayala Mirza on 06/11/2026.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    private func configureUI() {
        let homeController = HomeController()
        let homeNav = UINavigationController(rootViewController: homeController)
        homeController.tabBarItem = .init(title: "Home",
                                          image: .init(systemName: "house"),
                                        tag: 0)
        let countriesController = CountriesController()
        let countriesNav = UINavigationController(rootViewController: countriesController)
        countriesController.tabBarItem = .init(title: "Countries",
                                          image: .init(systemName: "globe"),
                                        tag: 0)
        let profileController = ProfileController()
        let profileNav = UINavigationController(rootViewController: profileController)
        profileController.tabBarItem = .init(title: "Home",
                                          image: .init(systemName: "person"),
                                        tag: 0)
        viewControllers = [homeNav,countriesNav, profileNav]
    }
}
