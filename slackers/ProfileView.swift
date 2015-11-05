//
//  ProfileView.swift
//  slackers
//
//  Created by Xiomara on 11/5/15.
//  Copyright © 2015 Xiomara. All rights reserved.
//

import Foundation
import UIKit

class ProfileView: UIView {
    
    var shouldUpdateConstraints = true
    
    var banner: UIView!
    var username: UILabel!
    var name: UILabel!
    var profileImage: UIImageView!
    var status: UIImageView!
    var skype: UILabel!
    var phone: UILabel!
    var email: UILabel!
    var title: UILabel!
    
    init() {
        super.init(frame: CGRectZero)
        self.backgroundColor = UIColor.whiteColor()
        
        banner = UIView(frame: CGRectZero)
        
        banner.backgroundColor = UIColor.grayColor()
        banner.autoSetDimension(.Height, toSize: defaultCellHeight)
        
        self.addSubview(banner)
        self.sendSubviewToBack(banner)
        
        profileImage = UIImageView(frame: CGRectZero)
        
        profileImage.backgroundColor = UIColor.whiteColor()
        profileImage.layer.borderColor = UIColor.grayColor().CGColor
        profileImage.layer.cornerRadius = defaultCornerRadius
        profileImage.layer.borderWidth = defaultBorderWidth
        
        
        profileImage.autoSetDimension(.Height, toSize: profileImageSize)
        profileImage.autoSetDimension(.Width, toSize: profileImageSize)
        
        self.addSubview(profileImage)
        self.bringSubviewToFront(profileImage)
        
        name = UILabel(frame: CGRectZero)
        
        self.addSubview(name)
        
        username = UILabel(frame: CGRectZero)
        
        self.addSubview(username)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func updateConstraints() {
        if shouldUpdateConstraints {
            
            banner.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: .Bottom)
            
            profileImage.autoAlignAxis(.Vertical, toSameAxisOfView: banner)
            profileImage.autoPinEdge(.Top, toEdge: .Bottom, ofView: banner, withOffset: -profileImageSize / 3)
            
            name.autoPinEdge(.Top, toEdge: .Bottom, ofView: profileImage, withOffset: 30.0)
            name.autoAlignAxis(.Vertical, toSameAxisOfView: profileImage)
            
            username.autoPinEdge(.Top, toEdge: .Bottom, ofView: name, withOffset: 5.0)
            username.autoAlignAxis(.Vertical, toSameAxisOfView: name)
            
            shouldUpdateConstraints = false
        }
        
        super.updateConstraints()
    }
}


