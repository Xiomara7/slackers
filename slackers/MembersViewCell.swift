//
//  MembersViewCell.swift
//  slackers
//
//  Created by Xiomara on 11/4/15.
//  Copyright © 2015 Xiomara. All rights reserved.
//

import UIKit

class MembersViewCell: UITableViewCell {
    
    var shouldUpdateConstraints = true
    
    var view: UIView!
    var username: UILabel!
    var name: UILabel!
    var profileImage: UIImageView!
    var isAdminLabel: UILabel!
    
    init(reuseIdentifier: String?) {
        super.init(style: .Default, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clearColor()
        
        view = UIView(frame: CGRectMake(10.0, 10.0, defaultscreenSize.width - 20.0, 84.0))
        
        view.backgroundColor = UIColor.clearColor()
        view.layer.borderWidth = defaultBorderWidth
        view.layer.cornerRadius = defaultCornerRadius
        
        self.contentView.addSubview(view)
        
        username = UILabel(frame: CGRectZero)
        username.font = UIFont(name: userFontName, size: 16.0)
        
        view.addSubview(username)
        
        name = UILabel(frame: CGRectZero)
        name.font = UIFont(name: nameFontName, size: 22.0)
        
        view.addSubview(name)
        
        profileImage = UIImageView(frame: CGRectZero)
        
        profileImage.backgroundColor = UIColor.grayColor()
        profileImage.contentMode = UIViewContentMode.ScaleAspectFill
        profileImage.layer.cornerRadius = defaultCornerRadius
        profileImage.layer.masksToBounds = true
        
        profileImage.autoSetDimension(.Height, toSize: 48.0)
        profileImage.autoSetDimension(.Width, toSize: 48.0)
        
        view.addSubview(profileImage)
        
        isAdminLabel = UILabel(frame: CGRectZero)
        isAdminLabel.font = UIFont(name: userFontName, size: 14.0)
        
        view.addSubview(isAdminLabel)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    class var defaultHeight: CGFloat {
        return defaultCellHeight
    }
    
    override func updateConstraints() {
        if shouldUpdateConstraints {
            
            let inset: CGFloat = 10.0
            
            profileImage.autoPinEdgeToSuperviewEdge(.Top, withInset: inset)
            profileImage.autoPinEdgeToSuperviewEdge(.Left, withInset: inset)
            
            name.autoPinEdge(.Left, toEdge: .Right, ofView: profileImage, withOffset: inset)
            name.autoPinEdgeToSuperviewEdge(.Top, withInset: inset)
            
            username.autoPinEdge(.Top, toEdge: .Bottom, ofView: name, withOffset: inset)
            username.autoPinEdge(.Left, toEdge: .Right, ofView: profileImage, withOffset: inset)
            
            isAdminLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: 10.0)
            isAdminLabel.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 10.0)
            
            shouldUpdateConstraints = false
        }
        
        super.updateConstraints()
    }
}
