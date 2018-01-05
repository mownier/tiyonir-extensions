//
//  HexTests.swift
//  TiyoNirExtensionsTests
//
//  Created by Mounir Ybanez on 1/4/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import TiyoNirExtensions

class HexTests: XCTestCase {
    
    func testToColorA() {
        var hex = Hex("#FF00FF")
        var color = hex.toColor()
        XCTAssertNotNil(color)
        XCTAssertEqual(color, UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 1.0))
        
        hex = Hex("#ff00ff")
        color = hex.toColor()
        XCTAssertNotNil(color)
        XCTAssertEqual(color, UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 1.0))
        
        hex = Hex("ff00ff")
        color = hex.toColor()
        XCTAssertNotNil(color)
        XCTAssertEqual(color, UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 1.0))
        
        hex = Hex("0xff00ff")
        color = hex.toColor()
        XCTAssertNotNil(color)
        XCTAssertEqual(color, UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 1.0))
    }
    
    func testToColorB() {
        let hex = Hex("#FF00FF00")
        let color = hex.toColor()
        XCTAssertNotNil(color)
        XCTAssertEqual(color, UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 0))
    }
    
    func testToColorC() {
        let hex = Hex("#FF00FF10")
        let color = hex.toColor()
        XCTAssertNotNil(color)
        XCTAssertEqual(color, UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 16 / 255))
    }
    
    func testToColorD() {
        var hex = Hex("#F")
        var color = hex.toColor()
        XCTAssertNil(color)
        
        hex = Hex("#FF")
        color = hex.toColor()
        XCTAssertNil(color)
        
        hex = Hex("#FF0")
        color = hex.toColor()
        XCTAssertNil(color)
        
        hex = Hex("#FF00")
        color = hex.toColor()
        XCTAssertNil(color)
        
        hex = Hex("#FF00F")
        color = hex.toColor()
        XCTAssertNil(color)
        
        hex = Hex("#FF00FF1")
        color = hex.toColor()
        XCTAssertNil(color)
        
        hex = Hex("#FF00FF10F")
        color = hex.toColor()
        XCTAssertNil(color)
        
        hex = Hex("#FF00FF#")
        color = hex.toColor()
        XCTAssertNil(color)
    }
    
    func testToColorE() {
        var hex = Hex("0xFF00GA")
        var color = hex.toColor()
        XCTAssertNil(color)
        
        hex = Hex("#FF00GA")
        color = hex.toColor()
        XCTAssertNil(color)
    }
    
    func testToColorF() {
        let hex = Hex("0Xff00ff")
        let color = hex.toColor()
        XCTAssertNil(color)
    }
    
    func testHashValueA() {
        let hex1 = Hex("0xff00ff")
        let hex2 = Hex("0xff0000")
        var info = [hex1: true]
        info[hex2] = true
        
        XCTAssertEqual(info.count, 2)
    }
    
    func testHashValueB() {
        let hex1 = Hex("0xff00ff")
        let hex2 = Hex("0xff00ff")
        var info = [hex1: true]
        info[hex2] = false
        
        XCTAssertEqual(info.count, 1)
        XCTAssertEqual(info[hex1], false)
    }
    
    func testDescriptionA() {
        var hex = Hex("ff00ff")
        
        XCTAssertEqual("#ff00ff", "\(hex)")
        
        hex = Hex("0xff00ff")
        
        XCTAssertEqual("0xff00ff", "\(hex)")
    }
    
    func testEqualityA() {
        var hex1 = Hex("ff00ff")
        var hex2 = Hex("0xFF00FF")
        XCTAssertEqual(hex1, hex2)
        
        hex2 = Hex("#FF00ff")
        XCTAssertEqual(hex1, hex2)
        
        hex1 = Hex("0xff00FF")
        XCTAssertEqual(hex1, hex2)
        
        hex1 = Hex("00ff00")
        XCTAssertNotEqual(hex1, hex2)
    }
}
