//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Yernar Baiginzheyev on 22.01.2024.
//

import UIKit

final class RMTabBarViewController: UITabBarController {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setUpTabs()
    }
    
    //MARK: - Settings
    
    private func setUpTabs() {
        let charactersVC = RMCharactersViewController()
        let locationsVC = RMLocationsViewController()
        let episodesVC = RMEpisodesViewController()
        let settingsVC = RMSettingsViewController()
        
        let viewControllers = [charactersVC, locationsVC, episodesVC, settingsVC]
        
        viewControllers.forEach({$0.navigationItem.largeTitleDisplayMode = .automatic})
        
        let charactersNavigationController = UINavigationController(rootViewController: charactersVC)
        let locationsNavigationController = UINavigationController(rootViewController: locationsVC)
        let episodesNavigationController = UINavigationController(rootViewController: episodesVC)
        let settingsNavigationController = UINavigationController(rootViewController: settingsVC)
        
        charactersNavigationController.tabBarItem = UITabBarItem(title: "Characters",
                                                                 image: UIImage(systemName: "person"),
                                                                 tag: 1)
        locationsNavigationController.tabBarItem = UITabBarItem(title: "Locations",
                                                                image: UIImage(systemName: "globe"),
                                                                tag: 2)
        episodesNavigationController.tabBarItem = UITabBarItem(title: "Episodes",
                                                               image: UIImage(systemName: "tv"),
                                                               tag: 3)
        settingsNavigationController.tabBarItem = UITabBarItem(title: "Settings",
                                                               image: UIImage(systemName: "gear"),
                                                               tag: 4)
        
        let navigationItems = [charactersNavigationController,
                               locationsNavigationController,
                               episodesNavigationController,
                               settingsNavigationController]
        
        navigationItems.forEach {  $0.navigationBar.prefersLargeTitles = true }
        
        setViewControllers(navigationItems,
                           animated: true)
    }
    
    
}

