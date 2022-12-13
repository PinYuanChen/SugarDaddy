//
// Created on 2022/12/8.
//

import UIKit

extension UIColor {
    /// SugarDaddy: Hex string to UIColor
    static func colorWithHex(hex: NSString, alpha: Float = 1) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString = String(cString.dropFirst())
        }
        
        guard cString.count == 6 else {
            return .gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r: CUnsignedLongLong = 0, g: CUnsignedLongLong = 0, b: CUnsignedLongLong = 0
        Scanner(string: rString).scanHexInt64(&r)
        Scanner(string: gString).scanHexInt64(&g)
        Scanner(string: bString).scanHexInt64(&b)
        return .init(red: CGFloat(r) / 255.0,
                       green: CGFloat(g) / 255.0,
                       blue: CGFloat(b) / 255.0,
                       alpha: CGFloat(alpha))
    }
}
