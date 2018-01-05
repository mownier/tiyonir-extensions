//
//  HexConverterTests.swift
//  TiyoNirExtensionsTests
//
//  Created by Mounir Ybanez on 1/5/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import TiyoNirExtensions

class HexConverterTests: XCTestCase {
    
    func testConvertA() {
        let converter = HexConverter()
        let color = UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 1.0)
        let hex = converter.convert(using: color)
        XCTAssertNotNil(hex)
        XCTAssertEqual(Hex("#ff00ff"), hex)
    }
}
