//
//  ViewController.swift
//  FirstPro
//
//  Created by Tarun Meena on 02/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
//        //for gradient navBarnavigation
        // controller is unreachable because t has no entry point
//        self.navigationItem.title = "Chat Setting"
//        let gradientLayer = CAGradientLayer()
//        var updatedFrame = self.navigationController!.navigationBar.bounds
//        updatedFrame.size.height += UIApplication.shared.statusBarFrame.size.height
//        gradientLayer.frame = updatedFrame
//        gradientLayer.colors = [UIColor.orange.cgColor, UIColor.orange.cgColor] // start color and end color
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0) // Horizontal gradient start
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0) // Horizontal gradient end
//        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
//        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        self.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
//
//
//        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setNavBar() {
        self.navigationItem.title          = "Chat Setting"
        let gradientLayer                  = CAGradientLayer()
        var updatedFrame                   = self.navigationController!.navigationBar.bounds
        updatedFrame .size.height          += UIApplication.shared.statusBarFrame.size.height
        gradientLayer.frame                = updatedFrame
        let color1                     = UIColor(red: 255.0/255.0, green: 137.0/255.0, blue: 39.0/255.0, alpha: 1.0).cgColor
        let color2                     = UIColor(red: 255.0/255.0, green: 169.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        gradientLayer.colors           = [color1, color2]
        gradientLayer.startPoint           = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint             = CGPoint(x: 15.0, y: 0.0)
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
    }

}

