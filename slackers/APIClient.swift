//
//  APIClient.swift
//  slackers
//
//  Created by Xiomara on 11/4/15.
//  Copyright © 2015 Xiomara. All rights reserved.
//

import Foundation
import CoreData

class APIClient: AFHTTPRequestOperationManager {
    
    struct URLHosts {
        static let production = productionUrl
        
    }
    
    struct Config {
        static let URLString = URLHosts.production
    }
    
    static let shared = APIClient()
    
    init() {
        super.init(baseURL: NSURL(string: Config.URLString))
        
        AFNetworkActivityIndicatorManager.sharedManager().enabled = true
        self.responseSerializer = AFHTTPResponseSerializer()
        self.responseSerializer.acceptableContentTypes = Set(["application/json", "text/html"])
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}

extension APIClient {
    
    func authTeam(token: String, completion: ((success: Bool, error: NSError?) -> Void)?) {
        let path = AUTH_PATH
        let parameters = ["token": token]
        
        postPath(path, parameters: parameters) { (operation, response) in
            if let error = response.error {
                if let block = completion {
                    block(success: false, error: error)
                }
                return
            }
            
            if let block = completion {
                let defaults = NSUserDefaults.standardUserDefaults()
                let team = String(response.json["team"])

                defaults.setObject(team, forKey: "appTitle")
                
                block(success: true, error: nil)
            }
        }
    }
    
    func getUsers(token: String, completion: ((success: Bool, error: NSError?) -> Void)?) {
        let path = USERS_PATH
        let parameters = ["token": token, "presence": 1]
        
        postPath(path, parameters: parameters as! [String : AnyObject]) { (operation, response) in
            if let error = response.error {
                if let block = completion {
                    block(success: false, error: error)
                }
                return
            }
            
            if let block = completion {
                let members = response.json["members"]
                DataManager.shared.saveMembers(members)
                
                print(members)
                block(success: true, error: nil)
            }
        }
    }
}

