//
//  EmailValidatorTests.swift
//  TiyoNirExtensionsTests
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import TiyoNirExtensions

class EmailValidatorTests: XCTestCase {
    
    func testIsValidEmailA() {
        let validator = EmailValidator()
        
        var email = Email("me@me.com")
        var ok = validator.isValidEmail(email)
        XCTAssertTrue(ok)
        
        email = Email("me.com")
        ok = validator.isValidEmail(email)
        XCTAssertFalse(ok)
        
        email = Email("me@.com")
        ok = validator.isValidEmail(email)
        XCTAssertFalse(ok)
        
        email = Email("@me.com")
        ok = validator.isValidEmail(email)
        XCTAssertFalse(ok)
        
        email = Email(".com")
        ok = validator.isValidEmail(email)
        XCTAssertFalse(ok)
        
        email = Email("me")
        ok = validator.isValidEmail(email)
        XCTAssertFalse(ok)
        
        email = Email("")
        ok = validator.isValidEmail(email)
        XCTAssertFalse(ok)
    }
    
    func testIsValidEmailB() {
        let validator = EmailValidator()
        let email = Email("me@me.com")
        let regex = "[]"
        let ok = validator.withRegexPattern(regex).isValidEmail(email)
        XCTAssertFalse(ok)
    }
}
