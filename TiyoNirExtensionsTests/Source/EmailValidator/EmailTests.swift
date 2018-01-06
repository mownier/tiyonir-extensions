//
//  EmailTests.swift
//  TiyoNirExtensionsTests
//
//  Created by Mounir Ybanez on 1/7/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import TiyoNirExtensions

class EmailTests: XCTestCase {
    
    func testInitA() {
        let string = "   me@me.com   \n"
        let email = Email(string)
        XCTAssertEqual(Email("me@me.com"), email)
        XCTAssertEqual("me@me.com", "\(email)")
    }
    
    func testHashValueA() {
        let email1 = Email("me@me.com")
        let email2 = Email("you@you.com")
        var info = [email1: true]
        info[email2] = true
        
        XCTAssertEqual(info.count, 2)
    }
    
    func testHashValueB() {
        let email1 = Email("me@me.com")
        let email2 = Email("me@me.com")
        var info = [email1: true]
        info[email2] = false
        
        XCTAssertEqual(info.count, 1)
        XCTAssertEqual(info[email1], false)
    }
    
    func testEqualityA() {
        let email1 = Email("me@me.com")
        let email2 = Email("you@you.com")
        XCTAssertNotEqual(email1, email2)
    }
}
