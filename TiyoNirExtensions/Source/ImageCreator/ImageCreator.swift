//
//  ImageCreator.swift
//  TiyoNirExtensions
//
//  Created by Mounir Ybanez on 1/4/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import UIKit

public protocol ImageCreator {

    func create() -> UIImage?
}

public class ImageCreation {
    
    public init() {
    }
    
    public func create(using creator: ImageCreator) -> UIImage? {
        return creator.create()
    }
}

public protocol ViewToImageCreatorParameter {
    
    func withView(_ view: UIView) -> ImageCreator & ViewToImageCreatorParameter
}

public final class ViewToImageCreator: ViewToImageCreatorParameter, ImageCreator {
    
    var view: UIView?
    var creation: ImageCreation
    
    public init() {
        self.creation = ImageCreation()
    }
    
    public func withView(_ aView: UIView) -> ImageCreator & ViewToImageCreatorParameter {
        view = aView
        return self
    }
    
    public func create() -> UIImage? {
        guard let creator = view else {
            return nil
        }

        let image = creation.create(using: creator)
        view = nil
        
        return image
    }
}

extension UIView: ImageCreator {
    
    public func create() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        let image = renderer.image { _ in
            drawHierarchy(in: bounds, afterScreenUpdates: true)
        }
        
        return image
    }
}

