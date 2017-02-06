//
//  自定义Label.swift
//  support
//
//  Created by SevenWang on 2017/2/6.
//  Copyright © 2017年 liuzhiyi. All rights reserved.
//

import UIKit
@IBDesignable
public class SWLabel: UILabel {
    
    private var padding = UIEdgeInsets.zero
    
    @IBInspectable
    public var paddingLeft: CGFloat {
        get { return padding.left }
        set { padding.left = newValue }
    }
    
    @IBInspectable
    public var paddingRight: CGFloat {
        get { return padding.right }
        set { padding.right = newValue }
    }
    
    @IBInspectable
    public var paddingTop: CGFloat {
        get { return padding.top }
        set { padding.top = newValue }
    }
    
    @IBInspectable
    public var paddingBottom: CGFloat {
        get { return padding.bottom }
        set { padding.bottom = newValue }
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    public override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, padding))
    }
    
    public override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insets = self.padding
        var rect = super.textRect(forBounds: UIEdgeInsetsInsetRect(bounds, insets), limitedToNumberOfLines: numberOfLines)
        rect.origin.x    -= insets.left
        rect.origin.y    -= insets.top
        rect.size.width  += (insets.left + insets.right)
        rect.size.height += (insets.top + insets.bottom)
        return rect
    }
    
}
