//
//  HexColorConverter.swift
//  TiyoNirExtensions
//
//  Created by Mounir Ybanez on 1/4/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import UIKit

public protocol HexColorConverterParameter {
    
    func withHex(_ hex: Hex) -> ColorConvertible
    func withColor(_ color: UIColor) -> HexConvertible
}

public class HexColorConverter: HexColorConverterParameter, HexConvertible, ColorConvertible {
    
    var hex: Hex?
    var color: UIColor?
    var hexPrefix: Hex.Prefix
    
    public init(hexPrefix: Hex.Prefix = .pound) {
        self.hexPrefix = hexPrefix
    }
    
    public func toColor() -> UIColor? {
        guard let converter = hex else {
            return nil
        }
        
        let color = converter.toColor()
        hex = nil
        
        return color
    }
    
    public func toHex() -> Hex? {
        guard let converter = color else {
            return nil
        }
        
        let hex = converter.toHex(withPrefix: hexPrefix)
        color = nil
        
        return hex
    }
    
    public func withHex(_ aHex: Hex) -> ColorConvertible {
        hex = aHex
        return self
    }
    
    public func withColor(_ aColor: UIColor) -> HexConvertible {
        color = aColor
        return self
    }
}
