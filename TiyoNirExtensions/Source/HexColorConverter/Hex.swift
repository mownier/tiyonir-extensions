//
//  Hex.swift
//  TiyoNirExtensions
//
//  Created by Mounir Ybanez on 1/4/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public struct Hex: Hashable, CustomStringConvertible {
  
    public enum Prefix: String {
        
        case pound = "#"
        case zerox = "0x"
    }
    
    var string: String = ""
    var sanitized: String = ""
    
    public init(_ string: String) {
        var sanitized = "\(string)".trimmingCharacters(in: .whitespacesAndNewlines)
        var prefixString = Prefix.pound.rawValue
        
        if sanitized.hasPrefix(Prefix.pound.rawValue) {
            sanitized.removeFirst(Prefix.pound.rawValue.characters.count)
            
        } else if sanitized.hasPrefix(Prefix.zerox.rawValue) {
            sanitized.removeFirst(Prefix.zerox.rawValue.characters.count)
            prefixString = Prefix.zerox.rawValue
        }
        
        sanitized = sanitized.lowercased()
        
        let allowed: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "a", "b", "c", "d", "e", "f"]
        
        if sanitized == sanitized.filter({ allowed.contains($0) }) {
            self.string = prefixString.appending(sanitized)
            self.sanitized = sanitized
        }
    }
    
    public var hashValue: Int {
        return string.lowercased().hashValue
    }
    
    public var description: String {
        return string
    }
    
    public static func ==(lhs: Hex, rhs: Hex) -> Bool {
        return lhs.sanitized.lowercased() == rhs.sanitized.lowercased()
    }
}
