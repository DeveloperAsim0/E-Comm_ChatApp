//
//  Product.swift
//  FirstPro
//
//  Created by Tarun Meena on 17/03/20.
//  Copyright © 2020 Tarun Meena. All rights reserved.
//

import Foundation
import UIKit

class Product: NSObject {
    
    var name:    String!   = ""
    var price:   Double!   = 0
    var image:   UIImage?
    var details: String!   = ""
    var uid:     String!
    
    
    override init() {
    }
    
    init(name: String, price: Double, image: UIImage, details: String, uid: String){
        self.name      = name
        self.price     = price
        self.image     = image
        self.details   = details
        self.uid       = uid
    }
    
    init(name: String, price: Double, details: String, uid: String) {
        self.name      = name
        self.price     = price
        self.details   = details
        self.uid       = uid
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let otherProduct = object as? Product {
            if self.name == otherProduct.name && self.price == otherProduct.price && self.image == otherProduct.image && self.details == otherProduct.details && self.uid == otherProduct.uid {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
}

