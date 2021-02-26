//
//  MainViewController.swift
//  My CV
//
//  Created by Emilio Del Castillo on 26/02/2021.
//

import UIKit

class MainViewController: UITabBarController {

    @IBOutlet weak var navItem: UINavigationItem!
    
    let titles = ["Formation", "Expérience", "Compétences", "Loisirs"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navItem.title = titles.first
        
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // Get the index of the current tab
        if let itemIdex = tabBar.items?.firstIndex(of: item) {
            navItem.title = titles[itemIdex]
        }
    }
    
}
