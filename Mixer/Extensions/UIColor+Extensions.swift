//
//  UIColor+Extensions.swift
//  Mixer
//
//  Created by Neftali Samarey on 5/3/22.
//

import UIKit

public extension UIColor {

    convenience init(hex: String) {
        var color: UInt32 = 0

        let isAlphaIncluded = hex.count == 8
        let shiftRed = isAlphaIncluded ? 24 : 16
        let shiftGreen = isAlphaIncluded ? 16 : 8
        let shiftBlue = isAlphaIncluded ? 8 : 0

        let scanner = Scanner(string: hex)
        scanner.scanHexInt32(&color)

        let mask = 0x000000FF
        let r = Int(color >> shiftRed) & mask
        let g = Int(color >> shiftGreen) & mask
        let b = Int(color >> shiftBlue) & mask
        let a = isAlphaIncluded ? Int(color) & mask : 100

        let red = CGFloat(r) / 255
        let green = CGFloat(g) / 255
        let blue = CGFloat(b) / 255
        let alpha = CGFloat(a) / 100

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
