//
//  UIColor+Helpers.swift
//  
//
//  Created by Dillon McElhinney on 5/9/21.
//

import UIKit

public extension UIColor {

    convenience init(hexRed: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: hexRed / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }

    convenience init(hex: UInt32) {
        let red: CGFloat
        let green: CGFloat
        let blue: CGFloat
        let alpha: CGFloat

        if hex <= 0xFFFFFF {
            // assume there is no alpha
            red = CGFloat((hex >> 16) & 0xFF)
            green = CGFloat((hex >> 8) & 0xFF)
            blue = CGFloat(hex & 0xFF)
            alpha = 1
        } else {
            red = CGFloat((hex >> 24) & 0xFF)
            green = CGFloat((hex >> 16) & 0xFF)
            blue = CGFloat((hex >> 8) & 0xFF)
            alpha = CGFloat(hex & 0xFF) / 0xFF
        }
        
        self.init(hexRed: red, green: green, blue: blue, alpha: alpha)
    }

}
