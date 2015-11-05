//
//  Profile.swift
//  slackers
//
//  Created by Xiomara on 11/4/15.
//  Copyright © 2015 Xiomara. All rights reserved.
//

import Foundation
import CoreData

@objc(Profile)
class Profile: NSManagedObject {
    @NSManaged var email: String?
    @NSManaged var phone: String?
    @NSManaged var skype: String?
    @NSManaged var title: String?
    @NSManaged var tz_label: String?
    @NSManaged var tz: String?
    
    @NSManaged var image_24: String?
    @NSManaged var image_32: String?
    @NSManaged var image_48: String?
    @NSManaged var image_72: String?
    @NSManaged var image_192: String?
    
    @NSManaged var user: User!
    
}

