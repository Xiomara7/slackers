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
        
        self.responseSerializer = AFHTTPResponseSerializer()
        self.responseSerializer.acceptableContentTypes = Set(["application/json", "text/html"])
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}

extension APIClient {
    
    func authTeam(token: String, completion: ((success: Bool, error: NSError?) -> Void)?) {
        let path = authPath
        let parameters = ["token": token]
        
        postPath(path, parameters: parameters) { (operation, response) in
            if let error = response.error {
                if let block = completion {
                    block(success: false, error: error)
                }
                return
            }
            
            if let block = completion {
                block(success: true, error: nil)
            }
        }
    }
    
    func getUsers(token: String, completion: ((success: Bool, error: NSError?) -> Void)?) {
        let path = usersPath
        let parameters = ["token": token]
        
        postPath(path, parameters: parameters) { (operation, response) in
            if let error = response.error {
                if let block = completion {
                    block(success: false, error: error)
                }
                return
            }
            
            if let block = completion {
                block(success: true, error: nil)
            }
        }
    }
}

