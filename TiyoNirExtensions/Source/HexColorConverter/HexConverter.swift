//
//  HexConverter.swift
//  TiyoNirExtensions
//
//  Created by Mounir Ybanez on 1/5/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import UIKit

public protocol HexConvertible {
    
    func toHex() -> Hex?
}

public class HexConverter {
    
    public func convert(using convertible: HexConvertible) -> Hex? {
        return convertible.toHex()
    }
}

extension UIColor: HexConvertible {
    
    public func toHex() -> Hex? {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        guard r >= 0, r <= 1.0, g >= 0, g <= 1.0, b >= 0, b <= 1.0, a >= 0, a <= 1.0 else {
            return nil
        }
        
        let format: String
        let rgb: Int
        
        if a != 1.0 {
            rgb = (Int)(r * 255) << 24 | (Int)(g * 255) << 16 | (Int)(b * 255) << 8 | (Int)(a * 255) << 0
            format = "\(Hex.Prefix.pound.rawValue)%08x"
            
        } else {
            rgb = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int)(b * 255) << 0
            format = "\(Hex.Prefix.pound.rawValue)%06x"
        }
        
        return Hex(String(format: format, rgb))
    }
    
    public func toHex(withPrefix prefix: Hex.Prefix) -> Hex? {
        guard let hex = toHex() else {
            return nil
        }
        
        var string = hex.string
        string.removeFirst()
        string = prefix.rawValue.appending(string)
        return Hex(string)
    }
}
