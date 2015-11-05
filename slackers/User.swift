//
//  User.swift
//  slackers
//
//  Created by Xiomara on 11/4/15.
//  Copyright © 2015 Xiomara. All rights reserved.
//

import Foundation
import CoreData

@objc(User)
class User: NSManagedObject {
    @NSManaged var is_admin: NSNumber?
    @NSManaged var theme_color: String?
    @NSManaged var user_id: String?
    @NSManaged var username: String?
    @NSManaged var real_name: String?
    @NSManaged var profile: Profile!
}
