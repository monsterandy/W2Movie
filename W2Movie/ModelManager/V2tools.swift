//
//  V2tools.swift
//  W2Movie
//
//  Created by 麻哲源 on 2017/3/19.
//  Copyright © 2017年 Andy. All rights reserved.
//

import UIKit

let v2tools = V2tools()

class V2tools {
    func getTextWidth(string: String, font: UIFont) -> CGFloat {
        let attributes = [NSFontAttributeName:font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = string.boundingRect(with: CGSize(width: 320.0, height: 999.9), options: option, attributes: attributes, context: nil)
        return rect.width
    }

}
