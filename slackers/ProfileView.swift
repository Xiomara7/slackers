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
    var closeButton: UIButton!
    
    var skype: UILabel!
    var phone: UILabel!
    var email: UILabel!
    var title: UILabel!
    
    var skypeIcon: UIImageView!
    var phoneIcon: UIImageView!
    var emailIcon: UIImageView!
    
    init() {
        super.init(frame: CGRectZero)
        self.backgroundColor = UIColor.whiteColor()
        
        banner = UIView(frame: CGRectZero)
        banner.translatesAutoresizingMaskIntoConstraints = true
        banner.backgroundColor = UIColor.grayColor()
        banner.autoSetDimension(.Height, toSize: defaultCellHeight)
        
        self.addSubview(banner)
        self.sendSubviewToBack(banner)
        
        profileImage = UIImageView(frame: CGRectZero)
        profileImage.translatesAutoresizingMaskIntoConstraints = true
        
        profileImage.backgroundColor = UIColor.whiteColor()
        profileImage.contentMode = UIViewContentMode.ScaleAspectFill
        profileImage.layer.borderColor = UIColor.grayColor().CGColor
        profileImage.layer.cornerRadius = defaultCornerRadius
        profileImage.layer.borderWidth = defaultBorderWidth
        profileImage.layer.masksToBounds = true

        profileImage.autoSetDimension(.Height, toSize: profileImageSize)
        profileImage.autoSetDimension(.Width, toSize: profileImageSize)
        
        self.addSubview(profileImage)
        self.bringSubviewToFront(profileImage)
        
        name = UILabel(frame: CGRectZero)
        name.font = UIFont(name: nameFontName, size: 24.0)
        
        self.addSubview(name)
        
        username = UILabel(frame: CGRectZero)
        username.font = UIFont(name: userFontName, size: 14.0)
        self.addSubview(username)
        
        title = UILabel(frame: CGRectZero)
        self.addSubview(title)
        
        email = UILabel(frame: CGRectZero)
        email.font = UIFont(name: normalFontName, size: 14.0)
        self.addSubview(email)
        
        phone = UILabel(frame: CGRectZero)
        phone.font = UIFont(name: normalFontName, size: 14.0)
        self.addSubview(phone)
        
        skype = UILabel(frame: CGRectZero)
        skype.font = UIFont(name: normalFontName, size: 14.0)
        self.addSubview(skype)
        
        skypeIcon = UIImageView(image: UIImage(named: IMG_SKYPE))

        skypeIcon.autoSetDimension(.Width, toSize: 24.0)
        skypeIcon.autoSetDimension(.Height, toSize: 24.0)
        
        skypeIcon.contentMode = UIViewContentMode.ScaleAspectFit
        skypeIcon.layer.masksToBounds = true
        
        self.addSubview(skypeIcon)
        
        emailIcon = UIImageView(image: UIImage(named: IMG_EMAIL))

        emailIcon.autoSetDimension(.Width, toSize: 24.0)
        emailIcon.autoSetDimension(.Height, toSize: 24.0)
        
        emailIcon.contentMode = UIViewContentMode.ScaleAspectFit
        emailIcon.layer.masksToBounds = true
        
        self.addSubview(emailIcon)
        
        phoneIcon = UIImageView(image: UIImage(named: IMG_PHONE))
        
        phoneIcon.autoSetDimension(.Width, toSize: 24.0)
        phoneIcon.autoSetDimension(.Height, toSize: 24.0)
        
        phoneIcon.contentMode = UIViewContentMode.ScaleAspectFit
        phoneIcon.layer.masksToBounds = true
        
        self.addSubview(phoneIcon)
        
        closeButton = UIButton(frame: CGRectZero)
        closeButton.setImage(UIImage(named: IMG_CLOSE), forState: .Normal)
        
        self.addSubview(closeButton)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func updateConstraints() {
        if shouldUpdateConstraints {
            
            banner.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: .Bottom)
            
            closeButton.autoPinEdgeToSuperviewEdge(.Top, withInset: 20.0)
            closeButton.autoPinEdgeToSuperviewEdge(.Left, withInset: 20.0)
            
            profileImage.autoAlignAxis(.Vertical, toSameAxisOfView: banner)
            profileImage.autoPinEdge(.Top, toEdge: .Bottom, ofView: banner, withOffset: -profileImageSize / 3)
            
            name.autoPinEdge(.Top, toEdge: .Bottom, ofView: profileImage, withOffset: 30.0)
            name.autoAlignAxis(.Vertical, toSameAxisOfView: profileImage)
            
            username.autoPinEdge(.Top, toEdge: .Bottom, ofView: name, withOffset: 5.0)
            username.autoAlignAxis(.Vertical, toSameAxisOfView: name)
            
            title.autoPinEdge(.Top, toEdge: .Bottom, ofView: username, withOffset: 5.0)
            title.autoAlignAxis(.Vertical, toSameAxisOfView: username)
            
            emailIcon.autoPinEdge(.Top, toEdge: .Bottom, ofView: title, withOffset: 44.0)
            emailIcon.autoPinEdgeToSuperviewEdge(.Left, withInset: 20.0)
            
            email.autoPinEdge(.Top, toEdge: .Bottom, ofView: title, withOffset: 44.0)
            email.autoPinEdge(.Left, toEdge: .Right, ofView: emailIcon, withOffset: 5.0)
            
            phoneIcon.autoPinEdge(.Top, toEdge: .Bottom, ofView: email, withOffset: 10.0)
            phoneIcon.autoPinEdgeToSuperviewEdge(.Left, withInset: 20.0)
            
            phone.autoPinEdge(.Top, toEdge: .Bottom, ofView: email, withOffset: 10.0)
            phone.autoPinEdge(.Left, toEdge: .Right, ofView: phoneIcon, withOffset: 5.0)
            
            skypeIcon.autoPinEdge(.Top, toEdge: .Bottom, ofView: phone, withOffset: 10.0)
            skypeIcon.autoPinEdgeToSuperviewEdge(.Left, withInset: 20.0)

            skype.autoPinEdge(.Top, toEdge: .Bottom, ofView: phone, withOffset: 10.0)
            skype.autoPinEdge(.Left, toEdge: .Right, ofView: skypeIcon, withOffset: 5.0)
            
            
            shouldUpdateConstraints = false
        }
        
        super.updateConstraints()
    }
}


