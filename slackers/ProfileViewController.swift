//
//  ProfileViewController.swift
//  slackers
//
//  Created by Xiomara on 11/5/15.
//  Copyright © 2015 Xiomara. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {
    
    var profileView: ProfileView!
    var userProfile: Profile!
    
    init(profile: Profile) {
        super.init(nibName: nil, bundle: nil)
        
        userProfile = profile
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileView = ProfileView()
        
        profileView.name.text = userProfile.email
        profileView.username.text = "@chris"
        
        self.view.addSubview(profileView)
        
        // AutoLayout
        
        profileView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero)
        
    }
}