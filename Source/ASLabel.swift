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
    final var PADDING: CGFloat = 4
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
    public func setFont(_ font: UIFont?) -> ASLabel {
        myLabel?.font = font
        return self
    }
    
    @discardableResult
    public func setTintDepth(_ value: CGFloat) -> ASLabel {
        PADDING = value
        subViewDelegate?.setupConstraints()
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
}

extension ASLabel {
    @discardableResult
    public func setBorderWith(borderColor:UIColor, borderWidth:CGFloat) -> ASLabel {
        container?.layer.rasterizationScale = UIScreen.main.scale
        container?.layer.shouldRasterize = true
        container?.layer.borderColor = borderColor.cgColor
        container?.layer.borderWidth = borderWidth
        return self
    }
}
