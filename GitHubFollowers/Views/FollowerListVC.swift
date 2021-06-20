//
//  FollowerListVC.swift
//  GitHubFollowers
//
//  Created by Andrea Chagas on 20/6/21.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: errorMessage!, buttonTitle: "Ok")
                return
            }
            
            print("Followers.count = \(followers.count)")
            print(followers)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
