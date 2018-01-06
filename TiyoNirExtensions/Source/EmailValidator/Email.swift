//
//  Email.swift
//  TiyoNirExtensions
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

public struct Email: Hashable, CustomStringConvertible {

    var string: String
    
    public init(_ string: String) {
        self.string = string.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    public var description: String {
        return string
    }
    
    public var hashValue: Int {
        return string.hashValue
    }
    
    public static func ==(lhs: Email, rhs: Email) -> Bool {
        return lhs.string == rhs.string
    }
}
