//
//  UIImage+Helpers.swift
//  
//
//  Created by Dillon McElhinney on 5/9/21.
//

import UIKit

public extension UIImage {

    convenience init?(named name: String?) {
        guard let name = name else { return nil }
        self.init(named: name)
    }
    
}

public extension UIImage {

    //  Adapted from https://christianselig.com/2021/04/efficient-average-color/
    func averageColor(algorithm: AverageColorAlgorithm = .simple) -> UIColor? {
        guard let cgImage = cgImage else { return nil }

        let width = 40
        let size = CGSize(width: width, height: width)
        let totalPixels = width * width

        guard let context = standardizedContext(width: width) else { return nil }
        context.draw(cgImage, in: CGRect(origin: .zero, size: size))

        guard let pixelBuffer = context.data else { return nil }
        let pointer = pixelBuffer.bindMemory(to: UInt32.self, capacity: totalPixels)

        let (totalRed, totalGreen, totalBlue) = (0..<totalPixels)
            .reduce(into: (0,0,0)) { totals, index in
                let pixel = pointer[index]
                totals.0 += algorithm.accumulate(red(for: pixel))
                totals.1 += algorithm.accumulate(green(for: pixel))
                totals.2 += algorithm.accumulate(blue(for: pixel))
        }

        let averageRed = algorithm.average(totalRed, totalPixels)
        let averageGreen = algorithm.average(totalGreen, totalPixels)
        let averageBlue = algorithm.average(totalBlue, totalPixels)

        return UIColor(hexRed: averageRed, green: averageGreen, blue: averageBlue)
    }

    private func standardizedContext(width: Int) -> CGContext? {
        let colorSpace = CGColorSpaceCreateDeviceRGB()

        let bitmapInfo: UInt32 = CGBitmapInfo.byteOrder32Little.rawValue | CGImageAlphaInfo.premultipliedFirst.rawValue

        let context = CGContext(data: nil,
                                width: width,
                                height: width,
                                bitsPerComponent: 8,
                                bytesPerRow: width * 4,
                                space: colorSpace,
                                bitmapInfo: bitmapInfo)
        return context
    }

    private func red(for pixelData: UInt32) -> UInt8 {
        return UInt8((pixelData >> 16) & 255)
    }

    private func green(for pixelData: UInt32) -> UInt8 {
        return UInt8((pixelData >> 8) & 255)
    }

    private func blue(for pixelData: UInt32) -> UInt8 {
        return UInt8((pixelData >> 0) & 255)
    }
}

public extension UIImage {
    struct AverageColorAlgorithm {
        let accumulate: (UInt8) -> Int
        let average: (Int, Int) -> CGFloat

        public static let simple = AverageColorAlgorithm { Int($0) }
        average: { CGFloat($0) / CGFloat($1) }

        public static let squareRoot = AverageColorAlgorithm {
            Int(pow(CGFloat($0), CGFloat(2)))
        }
        average: {
            sqrt(CGFloat($0) / CGFloat($1))
        }
    }
}
