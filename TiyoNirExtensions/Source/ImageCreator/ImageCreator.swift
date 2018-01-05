//
//  ImageCreator.swift
//  TiyoNirExtensions
//
//  Created by Mounir Ybanez on 1/4/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import UIKit

public protocol ImageCreator {

    func createImage() -> UIImage?
}

public class ImageCreation {
    
    public init() {
    }
    
    public func create(using creator: ImageCreator) -> UIImage? {
        return creator.createImage()
    }
}

extension UIView: ImageCreator {
    
    public func createImage() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        let image = renderer.image { _ in
            drawHierarchy(in: bounds, afterScreenUpdates: true)
        }
        
        return image
    }
}

