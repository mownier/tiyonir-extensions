//
//  HexColorConverterTests.swift
//  TiyoNirExtensionsTests
//
//  Created by Mounir Ybanez on 1/5/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import TiyoNirExtensions

class HexColorConverterTests: XCTestCase {
  
    func testToColorA() {
        let converter = HexColorConverter()
        let color = converter.toColor()
        XCTAssertNil(color)
    }
    
    func testToColorB() {
        let converter = HexColorConverter()
        let hex = Hex("#ff00ff")
        let color = converter.withHex(hex).toColor()
        XCTAssertNotNil(color)
        XCTAssertEqual(UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 1.0), color)
    }
    
    func testToHexA() {
        let converter = HexColorConverter()
        let color = converter.toHex()
        XCTAssertNil(color)
    }
    
    func testToHexB() {
        let converter = HexColorConverter()
        let color = UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 1.0)
        let hex = converter.withColor(color).toHex()
        XCTAssertNotNil(hex)
        XCTAssertEqual(Hex("#ff00ff"), hex)
    }
    
    func testToHexC() {
        let converter = HexColorConverter(hexPrefix: .zerox)
        let color = UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 1.0)
        let hex = converter.withColor(color).toHex()
        XCTAssertNotNil(hex)
        XCTAssertEqual(Hex("0xff00ff"), hex)
    }
}
