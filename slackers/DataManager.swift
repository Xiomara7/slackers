//
//  DataManager.swift
//  slackers
//
//  Created by Xiomara on 11/4/15.
//  Copyright © 2015 Xiomara. All rights reserved.
//

import Foundation
import CoreData

class DataManager {
    
    func saveMembers(members: JSON) {
        
        for (_, member) in members {
            if !self.isDuplicate(String(member["id"])) {
                
                let userObject = NSEntityDescription.insertNewObjectForEntityForName(USER_ENTITY,
                    inManagedObjectContext:DELEGATE.managedObjectContext) as! User
                
                let profileObject = NSEntityDescription.insertNewObjectForEntityForName(PROFILE_ENTITY,
                    inManagedObjectContext:DELEGATE.managedObjectContext) as! Profile
                
                userObject.user_id = String(member["id"])
                userObject.username = String(member["name"])
                userObject.is_admin = Bool(member["is_admin"])
                userObject.theme_color = String(member["color"])
                userObject.real_name = String(member["real_name"])
                
                profileObject.skype = String(member["profile"]["skype"])
                profileObject.phone = String(member["profile"]["phone"])
                profileObject.title = String(member["profile"]["title"])
                profileObject.email = String(member["profile"]["email"])
                profileObject.tz = String(member["tz"])
                profileObject.tz_label = String(member["tz_label"])
                profileObject.image_48 = String(member["profile"]["image_48"])
                profileObject.image_192 = String(member["profile"]["image_192"])
                
                userObject.profile = profileObject
                
                do {
                    try DELEGATE.managedObjectContext.save()
                    
                } catch {
                    fatalError("\(SAVE_ERR): \(error)")
                }
            }
        }
    }
    
    func isDuplicate(id: String!) -> Bool {
        
        let fetchRequest = NSFetchRequest(entityName: USER_ENTITY)
        
        do { let results = try DELEGATE.managedObjectContext.executeFetchRequest(fetchRequest)
            let users = results as! [NSManagedObject]
            
            for index in 0 ..< users.count {
                if((users[index].valueForKey("user_id")) as? String == id){
                    return true
                }
            }
            return false
            
        } catch let error as NSError {
            print("\(FETCH_ERR)\(error),\(error.userInfo)")
        }
        return false
    }
    
    class var shared: DataManager {
        struct Singleton {
            static let instance = DataManager()
        }
        return Singleton.instance
    }
}

