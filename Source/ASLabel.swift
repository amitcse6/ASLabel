//
//  ASLabel.swift
//  superapp
//
//  Created by Amit on 1/7/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol ASLabelDelegate {
    @objc optional func textFieldShouldBeginEditing(_ asTextField: ASLabel, _ textField: UITextField)
    @objc optional func textFieldDidBeginEditing(_ asTextField: ASLabel, _ textField: UITextField)
}

public protocol ASLabelSubViewDelegate {
    func setupUIElements()
    func setupConstraints()
}


public class ASLabel: UIView {
    final var delegate: ASLabelDelegate?
    final var subViewDelegate: ASLabelSubViewDelegate?
    final var container: UIView?
    final var myTitle: UILabel?
    final var myLabel: UILabel?
    final var PADDING: CGFloat = 8
    final var iscCornerRadius = true
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if iscCornerRadius {
            let cornerRadius = (container?.bounds.size.height ?? 0 - PADDING*2) * 0.5
            container?.layer.cornerRadius = cornerRadius
        }
    }
}

extension ASLabel {
    public func getText() -> String? {
        return myLabel?.text
    }
    
    @discardableResult
    public func setTitle(_ text: String?, _ multiplier: Any? = nil) -> ASLabel {
        myTitle?.text = text ?? ""
        setTitleWidthWith(multiplier) 
        return self
    }
    
    @discardableResult
    public func setText(_ text: String?) -> ASLabel {
        myLabel?.text = text ?? ""
        return self
    }
    
    @discardableResult
    public func setCornerRadius(_ iscCornerRadius: Bool) -> ASLabel {
        self.iscCornerRadius = iscCornerRadius
        layoutSubviews()
        return self
    }
    
    @discardableResult
    public func setAllFont(_ font: UIFont?) -> ASLabel {
        myTitle?.font = font
        myLabel?.font = font
        return self
    }
    
    @discardableResult
    public func setAllTextColor(_ textColor: UIColor) -> ASLabel {
        myTitle?.textColor = textColor
        myLabel?.textColor = textColor
        return self
    }
    
    @discardableResult
    public func setNumberOfLines(_ numberOfLines: Int) -> ASLabel {
        myTitle?.numberOfLines = 0
        myLabel?.numberOfLines = 0
        superview?.layoutIfNeeded()
        layoutIfNeeded()
        return self
    }
    
    @discardableResult
    public func setTintDepth(_ value: CGFloat) -> ASLabel {
        PADDING = value
        subViewDelegate?.setupConstraints()
        return self
    }
}

// MARK: - self
extension ASLabel {
    @discardableResult
    public func setBackgroundAndTintColor(_ backgroundColor: UIColor) -> ASLabel {
        setTintColor(backgroundColor)
        setBackgroundColor(backgroundColor)
        return self
    }
    
    @discardableResult
    public func setTintColor(_ backgroundColor: UIColor) -> ASLabel {
        self.backgroundColor = backgroundColor
        return self
    }
}

// MARK: - Container
extension ASLabel {
    @discardableResult
    public func setBackgroundColor(_ backgroundColor: UIColor) -> ASLabel {
        container?.backgroundColor = backgroundColor
        return self
    }
    
    @discardableResult
    public func setBordeColor(_ borderColor: UIColor) -> ASLabel {
        container?.layer.borderColor = borderColor.cgColor
        return self
    }
    
    @discardableResult
    public func setBordeWidth(_ borderWidth: CGFloat) -> ASLabel {
        container?.layer.borderWidth = borderWidth
        return self
    }
    
    @discardableResult
    public func setCornerRadius(_ cornerRadius: CGFloat) -> ASLabel {
        container?.layer.cornerRadius = cornerRadius
        return self
    }
    
    @discardableResult
    public func setBorderColor(_ borderColor:UIColor) -> ASLabel {
        container?.layer.borderColor = borderColor.cgColor
        return self
    }
    
    @discardableResult
    public func setDefaultShadow() -> ASLabel {
        if #available(iOS 9.0, *) {
            setShadow(UIColor(aslValue: "#ffffff", alpha: 1.0), UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0), UIColor(aslValue: "#AAAAAA", alpha: 1.0), 5, scale: true)
        } else {
            // Fallback on earlier versions
        }
        return self
    }
    
    @discardableResult
    public func setShadow(_ backgroundColor: UIColor, _ borderColor: UIColor, _ shadowColor: UIColor, _ shadowRadius: CGFloat, scale: Bool) -> ASLabel {
        self.container?.layer.shouldRasterize = true
        self.container?.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        self.container?.backgroundColor = backgroundColor
        self.container?.layer.cornerRadius = shadowRadius
        self.container?.layer.borderColor = borderColor.cgColor
        self.container?.layer.borderWidth = 1
        self.container?.layer.shadowColor = shadowColor.cgColor
        self.container?.layer.shadowOpacity = 1
        self.container?.layer.shadowOffset = CGSize.zero
        self.container?.layer.shadowRadius = shadowRadius
        return self
    }}

@available(iOS 9.0, *)
extension UIColor {
    convenience init(aslRed: Int, green: Int, blue: Int, alpha: CGFloat) {
        assert(aslRed >= 0 && aslRed <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(aslRed) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    convenience init(aslValue: Int, alpha: CGFloat) {
        self.init(red: CGFloat((aslValue >> 16) & 0xFF), green: CGFloat((aslValue >> 8) & 0xFF), blue: CGFloat(aslValue & 0xFF), alpha: alpha)
    }
    
    convenience init(aslValue: String, alpha: CGFloat = 1.0) {
        let hexString: String = aslValue.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    func aslHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}
