//
//  ColorConverter.swift
//  TiyoNirExtensions
//
//  Created by Mounir Ybanez on 1/5/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import UIKit

public protocol ColorConvertible {
    
    func toColor() -> UIColor?
}

public class ColorConverter {

    func convert(using convertible: ColorConvertible) -> UIColor? {
        return convertible.toColor()
    }
}

extension Hex: ColorConvertible {
    
    public func toColor() -> UIColor? {
        var rgb: UInt32 = 0
        let scanner = Scanner(string: sanitized)
        scanner.scanHexInt32(&rgb)
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        switch sanitized.characters.count {
        case 6:
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
            
        case 8:
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
            
        default:
            return nil
        }
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}

