//
//  Extensions+UIColor.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/22.
//

import UIKit

extension UIColor {
    
    @nonobjc class var white: UIColor {
        return UIColor(white: 1.0, alpha: 1.0)
    }
    
    @nonobjc class var gray10: UIColor {
        return UIColor(white: 248.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var gray20: UIColor {
        return UIColor(white: 243.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var gray30: UIColor {
        return UIColor(white: 241.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var gray60: UIColor {
        return UIColor(white: 99.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var gray50: UIColor {
        return UIColor(white: 189.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var gray40: UIColor {
        return UIColor(white: 205.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var gray70: UIColor {
        return UIColor(white: 79.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var gray80: UIColor {
        return UIColor(white: 64.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var gray90: UIColor {
        return UIColor(white: 54.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var popularGreen: UIColor {
        return UIColor(red: 99.0 / 255.0, green: 115.0 / 255.0, blue: 64.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var popularYellow: UIColor {
        return UIColor(red: 250.0 / 255.0, green: 191.0 / 255.0, blue: 76.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var popularDarkBrown: UIColor {
        return UIColor(red: 115.0 / 255.0, green: 79.0 / 255.0, blue: 34.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var popularLightBrown: UIColor {
        return UIColor(red: 191.0 / 255.0, green: 140 / 255.0, blue: 78 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var popularBrown: UIColor {
        return UIColor(red: 115.0 / 255.0, green: 89.0 / 255.0, blue: 67.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var bookmarkGray: UIColor {
        return UIColor(red: 63.0 / 255.0, green: 72.0 / 255.0, blue: 89.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var bookmarkBlue: UIColor {
        return UIColor(red: 68.0 / 255.0, green: 110.0 / 255.0, blue: 166.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var bookmarkLightBlue: UIColor {
        return UIColor(red: 130.0 / 255.0, green: 168.0 / 255.0, blue: 217.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var bookmarkDarkBlue: UIColor {
        return UIColor(red: 38.0 / 255.0, green: 92.0 / 255.0, blue: 140.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var bookmarkNude: UIColor {
        return UIColor(red: 217.0 / 255.0, green: 187.0 / 255.0, blue: 169.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var latestBlue: UIColor {
        return UIColor(red: 96.0 / 255.0, green: 146.0 / 255.0, blue: 166.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var latestBrownRed: UIColor {
        return UIColor(red: 191.0 / 255.0, green: 120.0 / 255.0, blue: 94.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var latestPink: UIColor {
        return UIColor(red: 242.0 / 255.0, green: 203.0 / 255.0, blue: 189.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var latestBurgundy: UIColor {
        return UIColor(red: 166.0 / 255.0, green: 90.0 / 255.0, blue: 73.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var latestDarkBrownRed: UIColor {
        return UIColor(red: 115.0 / 255.0, green: 57.0 / 255.0, blue: 52.0 / 255.0, alpha: 1.0)
    }
}

extension UIColor {
    convenience init(hexString: String) {
        var hexFormatted: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: CGFloat(1.0))
    }
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
