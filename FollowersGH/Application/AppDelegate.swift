//
//  AppDelegate.swift
//  FollowersGH
//
//  Created by Jadië Oliveira on 08/04/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = createTabBar()
		window?.makeKeyAndVisible()
		configureNavigationBar()
		return true
	}
	
	func createSearchtNC() -> UINavigationController {
		let searchVC = SearchVC()
		searchVC.title = "Search"
		searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
		
		return UINavigationController(rootViewController: searchVC)
	}
	
	func createFavoriteListNC() -> UINavigationController {
		let favoriteListVC = FavoriteListVC()
		favoriteListVC.title = "Favorites"
		favoriteListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
		
		return UINavigationController(rootViewController: favoriteListVC)
	}
	
	func createTabBar() -> UITabBarController {
		let tabBar = UITabBarController()
		UITabBar.appearance().tintColor = .systemTeal
		UITabBar.appearance().backgroundColor = .systemBackground
		tabBar.viewControllers = [createSearchtNC(), createFavoriteListNC()]
		
		return tabBar
	}
	
	func configureNavigationBar() {
		UINavigationBar.appearance().tintColor = .systemGreen
	}
	
}

