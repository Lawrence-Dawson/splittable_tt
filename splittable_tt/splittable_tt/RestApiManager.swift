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
    
    let sheetsuURL = "https://sheetsu.com/apis/v1.0/aaf79d4763af"
    
    func getSheetsuApi(completion: @escaping (JSON) -> Void) {
        let route = sheetsuURL
        makeHTTPGetRequest(path: route, completion: { json, err in
            completion(json as JSON)
        })
    }
    
    private func makeHTTPGetRequest(path: String, completion: @escaping RequestResponse) {
        let request = NSMutableURLRequest(url: NSURL(string: path)! as URL)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if let jsonData = data {
                let json:JSON = JSON(data: jsonData)
                completion(json, error as NSError?)
            } else {
                completion(nil, error as NSError?)
            }
        })
        task.resume()
    }
    
}
