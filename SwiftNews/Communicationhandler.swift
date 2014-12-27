//
//  Communicationhandler.swift
//  SwiftNews
//
//  Created by SourceKode-iOS on 27/12/14.
//  Copyright (c) 2014 iOS. All rights reserved.
//

import UIKit

class Communicationhandler: NSObject {
    
    func makeNetworkRequestForUrl(urlString:String, completionHandler:(responseDictionary:NSDictionary!,error:NSError!)->Void){
        
        let url = NSURL(string: urlString)
        
        
        let urlRequest = NSURLRequest(URL: url as NSURL!)
        
        
        let operationQueue = NSOperationQueue()
        
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: operationQueue) { (response, data, error) -> Void in
            
            
            
           /// println(NSString(data: data, encoding: NSUTF8StringEncoding))
            
            
            let dataDictionary = NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments, error: nil) as NSDictionary!
            
            println(dataDictionary)
            
            completionHandler(responseDictionary: dataDictionary, error: error)
            
            
        }
        
        
        
    }
   
}
