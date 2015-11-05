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
    var status: UIImageView!
    var isAdminLabel: UILabel!
    
    init(reuseIdentifier: String?) {
        super.init(style: .Default, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clearColor()
        
        view = UIView(frame: CGRectMake(10.0, 10.0, defaultscreenSize.width - 20.0, 84.0))
        
        view.backgroundColor = UIColor.clearColor()
        view.layer.borderColor = UIColor.purpleColor().CGColor
        view.layer.borderWidth = defaultBorderWidth
        view.layer.cornerRadius = defaultCornerRadius
        
        self.contentView.addSubview(view)
        
        username = UILabel(frame: CGRectZero)
        
        view.addSubview(username)
        
        name = UILabel(frame: CGRectZero)
        
        view.addSubview(name)
        
        profileImage = UIImageView(frame: CGRectZero)
        
        profileImage.backgroundColor = UIColor.grayColor()
        profileImage.layer.cornerRadius = defaultCornerRadius
        
        profileImage.autoSetDimension(.Height, toSize: 48.0)
        profileImage.autoSetDimension(.Width, toSize: 48.0)
        
        view.addSubview(profileImage)
        
        isAdminLabel = UILabel(frame: CGRectZero)
        
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
            
            shouldUpdateConstraints = false
        }
        
        super.updateConstraints()
    }
}
