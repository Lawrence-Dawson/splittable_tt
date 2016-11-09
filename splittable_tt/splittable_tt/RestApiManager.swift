//
//  RestApiManager.swift
//  splittable_tt
//
//  Created by Lawrence Dawson on 09/11/2016.
//  Copyright © 2016 Lawrence Dawson. All rights reserved.
//
import SwiftyJSON
import Foundation

typealias RequestResponse = (JSON, NSError?) -> Void

class RestApiManager: NSObject {
    static let sharedInstance = RestApiManager()
    
    let baseURL = "https://sheetsu.com/apis/v1.0/aaf79d4763af"
    
    func getRandomUser(onCompletion: @escaping (JSON) -> Void) {
        makeHTTPGetRequest(path: baseURL, onCompletion: { json, err -> Void in
            onCompletion(json)
        })
    }
    
    func makeHTTPGetRequest(path: String, onCompletion: @escaping RequestResponse) {
        let request = NSMutableURLRequest(url: NSURL(string: path) as! URL)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            let json:JSON = JSON(data)
            onCompletion(json, error as NSError?)
        })
        task.resume()
    }
}
