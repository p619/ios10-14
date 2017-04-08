//
//  Restaurant.swift
//  ios10ch9
//
//  Created by heroshi on 2017/4/4.
//  Copyright © 2017年 heroshi. All rights reserved.
//

import Foundation
class Restaurant {
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var isVisited = false
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
        
    }
    
    
    
    
}
