//
//  UIView+Extension.swift
//  FreshQiao2.0
//
//  Created by 邝子涵 on 2017/6/23.
//  Copyright © 2017年 上海仁菜网络科技有限公司. All rights reserved.
//

import UIKit

extension UIView {
    // MARK: - x
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.x    = newValue
            frame                 = tempFrame
        }
    }
    
    // MARK: - y
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.y    = newValue
            frame                 = tempFrame
        }
    }
    
    // MARK: - height
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.height = newValue
            frame                 = tempFrame
        }
    }
    
    // MARK: - width
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    // MARK: - size
    var size: CGSize {
        get {
            return frame.size
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    // MARK: - centerX
    var centerX: CGFloat {
        get {
            return center.x
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    
    // MARK: - centerY
    var centerY: CGFloat {
        get {
            return center.y
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.y = newValue
            center = tempCenter;
        }
    }
    
    // MARK: - maxX
    var maxX : CGFloat {
        get {
            return frame.maxX
        }
    }
    
    // MARK: - maxY
    var maxY : CGFloat {
        get {
            return frame.maxY
        }
    }
    
    // MARK: - minY
    var minY : CGFloat {
        get {
            return frame.minY
        }
    }
    
    var bottom : CGFloat {
        get {
            return frame.size.height + frame.origin.y
        }
    }
    
    var right : CGFloat {
        get {
            return frame.size.width + frame.origin.x
        }
    }
    
    func mediateY(_ subViewHeight:CGFloat) -> CGFloat {
        return ((self.height - subViewHeight)/2)
    }
    
    func mediateX(_ subViewWhite:CGFloat) -> CGFloat {
        return ((self.width - subViewWhite)/2)
    }
    
    
    // MARK: - 设置圆角
    func setViewBorder(cornerRadius:CGFloat = 3, color:UIColor) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = color.cgColor;
        self.layer.borderWidth = 1;
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = self.layer.contentsScale
    }
    
    func setViewBorderWidth(_ borderWidth:CGFloat = 1, _ borderColor:UIColor) {
        self.layer.borderColor = borderColor.cgColor;
        self.layer.borderWidth = borderWidth;
    }
    
    // MARK: - 设置阴影
    func setViewShadowColor(shadowOpacity:Float,shadowColor:UIColor,shadowOffset:CGSize) {
        
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
    }
    
    /// 设置单独某个位置圆角
    ///
    /// - Parameters:
    ///   - make: 圆角范围
    ///   - corners: 设置圆角位置
    /// - Returns: CAShapeLayer
    class func changeMaskLayer(rect:CGRect ,make: CGSize, corners: UIRectCorner) -> CAShapeLayer {
        let maskPath = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: make)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = rect
        maskLayer.path = maskPath.cgPath
        return maskLayer
    }
    
    
    /// 在view中获取view所在控制器
    ///
    /// - Returns: UIViewController
    func setViewController() -> UIViewController? {
        var next:UIView? = self
        repeat{
            if let nextResponder = next?.next {
                if nextResponder.isKind(of: UIViewController.self) {
                    return (nextResponder as! UIViewController)
                }
            }
            next = next?.superview
        }while next != nil
        return nil
    }
    
}
