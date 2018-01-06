//
//  EmailValidationTests.swift
//  TiyoNirExtensionsTests
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import TiyoNirExtensions

class EmailValidationTests: XCTestCase {
    
    func testIsValidEmailA() {
        let validation = EmailValidation()
        let validator = EmailValidator()
        
        var email = Email("me@me.com")
        var ok = validation.isValidEmail(email, using: validator)
        XCTAssertTrue(ok)
        
        email = Email("me.com")
        ok = validation.isValidEmail(email, using: validator)
        XCTAssertFalse(ok)
    }
}
