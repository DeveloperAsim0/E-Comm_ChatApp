//
//  GradientView.swift
//  FirstPro
//
//  Created by Tarun Meena on 06/01/20.
//  Copyright © 2020 Tarun Meena. All rights reserved.
//

import Foundation
import UIKit

class Colors {
    var gl:CAGradientLayer!
    
    init() {
        let colorTop = UIColor(red: 255 / 255.0, green: 137 / 255.0, blue: 39 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255 / 255.0, green: 169 / 255.0, blue: 0 / 255.0, alpha: 1.0).cgColor
        
        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}
