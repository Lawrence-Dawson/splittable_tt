//
//  proffessionObject.swift
//  splittable_tt
//
//  Created by Lawrence Dawson on 10/11/2016.
//  Copyright © 2016 Lawrence Dawson. All rights reserved.
//

import Foundation

import SwiftyJSON

class ProfessionObject {
        var name: String!
        var pictureURL: String!
        var sortOrder: String!
        var url: String!

    
    required init(json: JSON) {
        name = json["name"].stringValue
        pictureURL = json["image_url"].stringValue
        sortOrder = json["sort_order"].stringValue
        url = json["url"].stringValue
    }
}
