//
//  UIViewExtensionTests.swift
//  TiyoNirExtensionsTests
//
//  Created by Mounir Ybanez on 1/5/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import XCTest
@testable import TiyoNirExtensions

class UIViewExtensionTests: XCTestCase {
    
    func testCreateImage() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: frame)
        let image = view.createImage()
        XCTAssertNotNil(image)
        XCTAssertEqual(image?.size, CGSize(width: 100, height: 100))
    }
}
