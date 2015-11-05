//
//  AFNetworkingExtension.swift
//  slackers
//
//  Created by Xiomara on 11/4/15.
//  Copyright © 2015 Xiomara. All rights reserved.
//

import Foundation

typealias AFSuccessBlock = ((operation: AFHTTPRequestOperation!, responseObject: AnyObject!) -> Void)?
typealias AFErrorBlock = ((operation: AFHTTPRequestOperation!, error: NSError!) -> Void)?

typealias APIClientJSONResponse = (json: JSON, error: NSError?)
typealias APIClientCompletionBlock = ((operation: AFHTTPRequestOperation, response: APIClientJSONResponse) -> Void)?

extension AFHTTPRequestOperationManager {
    
    func postPath(path: String!, parameters: [String: AnyObject]!, completion: APIClientCompletionBlock) {
        POST(
            path,
            parameters:
            parameters,
            success: successBlockWithCompletion(completion),
            failure: failureBlockWithCompletion(completion)
        )
    }
    
    func getPath(path: String!, parameters: [String: AnyObject]?, completion: APIClientCompletionBlock) {
        GET(
            path,
            parameters:
            parameters,
            success: successBlockWithCompletion(completion),
            failure: failureBlockWithCompletion(completion)
        )
    }
    
    func successBlockWithCompletion(completion: APIClientCompletionBlock) -> AFSuccessBlock {
        let block: AFSuccessBlock = { (operation, responseObject) in
            var json: JSON
            
            if let object = responseObject as? NSData {
                json = JSON(data: object)
            } else if let object: AnyObject = responseObject {
                json = JSON(object)
            } else {
                json = JSON.null
            }
            
            if let block = completion {
                block(operation: operation, response: (json, nil))
            }
        }
        return block
    }
    
    private func failureBlockWithCompletion(completion: APIClientCompletionBlock) -> AFErrorBlock {
        let block: AFErrorBlock = { [weak self] (operation, error) in
            if let _ = self {
                var newError: NSError?
                
                if newError == nil {
                    newError = error
                }
                
                if let block = completion {
                    block(operation: operation, response: (nil, newError))
                }
            }
        }
        return block
    }
}

