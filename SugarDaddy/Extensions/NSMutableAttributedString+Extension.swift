//
// Created on 2022/12/8.
//

import UIKit

extension NSMutableAttributedString {

    func append(text: String, font: UIFont? = nil, textColor: UIColor? = nil) {

        var attributes = [NSAttributedString.Key : Any]()

        if let font = font {
            attributes[.font] = font
        }

        if let color = textColor {
            attributes[.foregroundColor] = color
        }

        append(.init(string: text, attributes: attributes))
    }

    func replace(targetText: String, font: UIFont? = nil, textColor: UIColor? = nil) {

        var attributes = [NSAttributedString.Key : Any]()

        if let font = font {
            attributes[.font] = font
        }

        if let color = textColor {
            attributes[.foregroundColor] = color
        }

        addAttributes(attributes, range: (string as NSString).range(of: targetText))
    }
}
