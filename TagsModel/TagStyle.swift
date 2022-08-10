//
//  TagStyle.swift
//  TagsControl
//
//  Created by Даниил on 07.08.2022.
//

import UIKit

//For select style
enum TagStyles {
    case defaultStyle
    case style1
    case style2
}

//For create method processing
struct TagStyle {
    let textColor: UIColor
    let font: UIFont
    let backgroundColor: UIColor
    let cornerRadius: CGFloat
    let borderWidth: CGFloat
    let borderColor: CGColor?
    
    ///Style number 1
    static func defaultStyle() -> TagStyle {
        return TagStyle.init(textColor: .black,
                             font: UIFont.systemFont(ofSize: 14),
                             backgroundColor: .white,
                             cornerRadius: 8,
                             borderWidth: 1,
                             borderColor: UIColor.lightGray.cgColor)
    }
    
    ///Style number 2
    static func style1() -> TagStyle {
        return TagStyle.init(textColor: .black,
                             font: UIFont.systemFont(ofSize: 14),
                             backgroundColor: .white,
                             cornerRadius: 10,
                             borderWidth: 2,
                             borderColor: UIColor.red.cgColor)
    }
    
    ///Style number 3
    static func style2() -> TagStyle {
        return TagStyle.init(textColor: .black,
                             font: UIFont.systemFont(ofSize: 14),
                             backgroundColor: .white,
                             cornerRadius: 14,
                             borderWidth: 0.7,
                             borderColor: UIColor.black.cgColor)
    }
}
