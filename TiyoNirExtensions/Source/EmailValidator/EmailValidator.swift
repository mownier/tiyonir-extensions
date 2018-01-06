
//
//  EmailValidator.swift
//  TiyoNirExtensions
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import Foundation

public protocol EmailValidatable {
    
    func isValidEmail(_ email: Email) -> Bool
}

public class EmailValidation {

    public init() {
    }
    
    public func isValidEmail(_ email: Email, using validator: EmailValidatable) -> Bool {
        return validator.isValidEmail(email)
    }
}

public class EmailValidator: EmailValidatable {
    
    var regexPattern: String
    
    public init() {
        self.regexPattern = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
    }
    
    public func isValidEmail(_ email: Email) -> Bool {
        var ok = true
        
        do {
            let regex = try NSRegularExpression(pattern: regexPattern)
            let nsString = email.string as NSString
            let matches = regex.matches(in: email.string, range: NSRange(location: 0, length: nsString.length))
            
            if matches.count == 0 {
                ok = false
            }
            
        } catch {
            ok = false
        }
        
        return  ok
    }
    
    func withRegexPattern(_ pattern: String) -> EmailValidatable {
        regexPattern = pattern
        return self
    }
}
