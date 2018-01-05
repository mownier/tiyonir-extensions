//
//  ColorConverterTests.swift
//  TiyoNirExtensionsTests
//
//  Created by Mounir Ybanez on 1/5/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import TiyoNirExtensions

class ColorConverterTests: XCTestCase {
    
    func testConvertA() {
        let converter = ColorConverter()
        let hex = Hex("#ff00ff")
        let color = converter.convert(using: hex)
        XCTAssertNotNil(color)
        XCTAssertEqual(UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 1.0), color)
    }
}
