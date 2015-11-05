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
    
    var profileImage: UIImage!
    
    init(profile: Profile, img: UIImage?) {
        super.init(nibName: nil, bundle: nil)
        
        userProfile = profile
        profileImage = img
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let user = userProfile.user as User!
        
        profileView = ProfileView()
        
        profileView.closeButton.addTarget(self,
                                          action: Selector("dismissAction:"),
                                          forControlEvents:.TouchUpInside)
        
        // Profile Info
        profileView.name.text = user.real_name
        profileView.username.text = "@\(user.username!)"

        profileView.title.text = userProfile.title
        profileView.email.text = userProfile.email
        profileView.phone.text = userProfile.phone
        profileView.skype.text = userProfile.skype
        
        profileView.banner.backgroundColor = UIColor(hexString: (user?.theme_color)!)
        
        profileView.profileImage.image = profileImage
        
        self.view.addSubview(profileView)
        
        // AutoLayout
        
        profileView.autoPinToTopLayoutGuideOfViewController(self, withInset: 0.0)
        profileView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: .Top)
        
    }

    func dismissAction(sender: AnyObject?){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
