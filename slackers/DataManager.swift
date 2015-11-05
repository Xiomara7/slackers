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
    
    class var shared: DataManager {
        struct Singleton {
            static let instance = DataManager()
        }
        return Singleton.instance
    }
}

