//
//  Model.swift
//  FirstPro
//
//  Created by Tarun Meena on 17/03/20.
//  Copyright © 2020 Tarun Meena. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class Model: NSObject {
    var segueArray      = [String]()
    var products        = [Product]()
    var segueDictionary = Dictionary<String, UIImage>()
    let Product_URL     = URL(string: "url.com")
    
    
    func refreshProducts() {
        request(Product_URL!).responseJSON { (myResponse) in
            switch myResponse.result {
            case .success:
                print("apiResponse:- \(myResponse.result)")
                let myData = try? JSON(data: myResponse.data!)
                print("myData:- \(myData!["results"])")
                
                //Getting result from an array
                  let resultArray = myData!["results"]
                for i in resultArray.arrayValue {
                    let newProduct = Product()
                    newProduct.name = i["name"].string
                    print("\(i["param_NAME"])")
                    newProduct.price = i["price"].double
                }
                
                break
            
            case .failure:
                print(Error.self)
            }
        }
    }
    
}
