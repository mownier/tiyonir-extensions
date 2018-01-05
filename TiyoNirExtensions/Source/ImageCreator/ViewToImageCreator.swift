//
//  ViewToImageCreator.swift
//  TiyoNirExtensions
//
//  Created by Mounir Ybanez on 1/5/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import UIKit

public protocol ViewToImageCreatorParameter {
    
    func withView(_ view: UIView) -> ImageCreator
}

public class ViewToImageCreator: ViewToImageCreatorParameter, ImageCreator {
    
    var view: UIView?
    
    public init() {
    }
    
    public func withView(_ aView: UIView) -> ImageCreator {
        view = aView
        return self
    }
    
    public func createImage() -> UIImage? {
        guard let creator = view else {
            return nil
        }
        
        let image = creator.createImage()
        view = nil
        
        return image
    }
}

