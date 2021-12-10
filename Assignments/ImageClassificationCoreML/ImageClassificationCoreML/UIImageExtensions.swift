//
//  UIImageExtensions.swift
//  ImageClassificationCoreML
//
//  Created by Nikita on 10.12.2021.
//

import Foundation
import UIKit

extension UIImage {
        
    func convertToBuffer() -> CVPixelBuffer? {
        
        let attributes = [
            kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
            kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue
        ] as CFDictionary
        
        var pixelBuffer: CVPixelBuffer?
        
        let status = CVPixelBufferCreate(
            kCFAllocatorDefault, Int(self.size.width),
            Int(self.size.height),
            kCVPixelFormatType_32ARGB,
            attributes,
            &pixelBuffer)
        
        guard (status == kCVReturnSuccess) else {
            return nil
        }
        
        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        
        let context = CGContext(
            data: pixelData,
            width: Int(self.size.width),
            height: Int(self.size.height),
            bitsPerComponent: 8,
            bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!),
            space: rgbColorSpace,
            bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
        
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        
        UIGraphicsPushContext(context!)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        UIGraphicsPopContext()
        
        CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        
        return pixelBuffer
    }
    
    /// Resize image
        /// - Parameter size: Size to resize to
        /// - Returns: Resized image
        func resize(size: CGSize) -> UIImage? {
            UIGraphicsBeginImageContext(size)
            draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }

        /// Create and return CoreVideo Pixel Buffer
        /// - Returns: Pixel Buffer
        func getCVPixelBuffer() -> CVPixelBuffer? {
            guard let image = cgImage else {
                 return nil
            }
            let imageWidth = Int(image.width)
            let imageHeight = Int(image.height)

            let attributes : [NSObject:AnyObject] = [
                kCVPixelBufferCGImageCompatibilityKey : true as AnyObject,
                kCVPixelBufferCGBitmapContextCompatibilityKey : true as AnyObject
            ]

            var pxbuffer: CVPixelBuffer? = nil
            CVPixelBufferCreate(
                kCFAllocatorDefault,
                imageWidth,
                imageHeight,
                kCVPixelFormatType_32ARGB,
                attributes as CFDictionary?,
                &pxbuffer
            )

            if let _pxbuffer = pxbuffer {
                let flags = CVPixelBufferLockFlags(rawValue: 0)
                CVPixelBufferLockBaseAddress(_pxbuffer, flags)
                let pxdata = CVPixelBufferGetBaseAddress(_pxbuffer)

                let rgbColorSpace = CGColorSpaceCreateDeviceRGB();
                let context = CGContext(
                    data: pxdata,
                    width: imageWidth,
                    height: imageHeight,
                    bitsPerComponent: 8,
                    bytesPerRow: CVPixelBufferGetBytesPerRow(_pxbuffer),
                    space: rgbColorSpace,
                    bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue
                )

                if let _context = context {
                    _context.draw(
                        image,
                        in: CGRect.init(
                            x: 0,
                            y: 0,
                            width: imageWidth,
                            height: imageHeight
                        )
                    )
                }
                else {
                    CVPixelBufferUnlockBaseAddress(_pxbuffer, flags);
                    return nil
                }

                CVPixelBufferUnlockBaseAddress(_pxbuffer, flags);
                return _pxbuffer;
            }

            return nil
        }
}
