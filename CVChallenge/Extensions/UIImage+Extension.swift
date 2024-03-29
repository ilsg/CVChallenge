//
//  UIImage+Extension.swift
//  CVChallenge
//
//  Created by isela on 6/11/19.
//  Copyright © 2019 isela. All rights reserved.
//

import UIKit

extension UIImage {

    /// Resize an image for a given size
    ///
    /// - Parameter newSize: Size of the image output
    /// - Returns: Resized image
    func resizedImage(newSize: CGSize) -> UIImage {
        var scaledImageRect = CGRect.zero
        
        let aspectWidth = newSize.width/size.width
        let aspectheight = newSize.height/size.height
        
        let aspectRatio = max(aspectWidth, aspectheight)
        
        scaledImageRect.size.width = size.width * aspectRatio;
        scaledImageRect.size.height = size.height * aspectRatio;
        scaledImageRect.origin.x = (newSize.width - scaledImageRect.size.width) / 2.0;
        scaledImageRect.origin.y = (newSize.height - scaledImageRect.size.height) / 2.0;
        
        UIGraphicsBeginImageContext(newSize)
        draw(in: scaledImageRect)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let image = scaledImage else {return self}
        return image
    }
}
