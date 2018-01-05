//
//  UIColorExtensionTests.swift
//  TiyoNirExtensionsTests
//
//  Created by Mounir Ybanez on 1/4/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import TiyoNirExtensions

class UIColorExtensionTests: XCTestCase {
   
    func testToHexA() {
        let color = UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 1.0)
        let hex = color.toHex()
        XCTAssertNotNil(hex)
        XCTAssertEqual(Hex("#ff00ff"), hex)
    }
    
    func testToHexB() {
        var color = UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 0.0)
        var hex = color.toHex()
        XCTAssertNotNil(hex)
        XCTAssertEqual(Hex("#ff00ff00"), hex)
        
        color = UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 16 / 255)
        hex = color.toHex()
        XCTAssertNotNil(hex)
        XCTAssertEqual(Hex("#ff00ff10"), hex)
    }
    
    func testToHexC() {
        let color = UIColor(red: 2.0, green: 0, blue: 1.0, alpha: 1.0)
        let hex = color.toHex()
        XCTAssertNil(hex)
    }
    
    func testToHexWithPrefixA() {
        let color = UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 1.0)
        let hex = color.toHex(withPrefix: Hex.Prefix.zerox)
        XCTAssertNotNil(hex)
        XCTAssertEqual(Hex("0xff00ff"), hex)
    }
    
    func testToHexWithPrefixB() {
        let color = UIColor(red: 2.0, green: 0, blue: 1.0, alpha: 1.0)
        let hex = color.toHex(withPrefix: Hex.Prefix.zerox)
        XCTAssertNil(hex)
    }
}
