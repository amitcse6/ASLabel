//
//  ASLabelStyleNormal.swift
//  superapp
//
//  Created by Amit on 9/7/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public class ASLabelStyleNormal: ASLabel, ASLabelSubViewDelegate {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public init(_ delegate: ASLabelDelegate) {
        super.init(frame: CGRect.zero)
        self.delegate = delegate
        setup()
    }
    
    public func setup() {
        subViewDelegate = self
        setupUIElements()
        setupConstraints()
    }
    
    public func setupUIElements() {
        backgroundColor = .clear
        
        iscCornerRadius = false
        
        container = UIView()
        addSubview(container.unsafelyUnwrapped)
        container?.layer.rasterizationScale = UIScreen.main.scale
        container?.layer.shouldRasterize = true
        container?.backgroundColor = .clear
        
        myTitle = UILabel()
        container?.addSubview(myTitle.unsafelyUnwrapped)
        myTitle?.backgroundColor = .clear
        myTitle?.textColor = .black
        myTitle?.textAlignment = .left
        myTitle?.text = ""
        myTitle?.numberOfLines = 0
        
        myLabel = UILabel()
        container?.addSubview(myLabel.unsafelyUnwrapped)
        myLabel?.backgroundColor = .clear
        myLabel?.textColor = UIColor.black
        myLabel?.textAlignment = .left
        myLabel?.text = ""
        myLabel?.numberOfLines = 0
    }
    
    public func setupConstraints() {
        container?.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 9.0, *) {
            container?.topAnchor.constraint(equalTo: topAnchor, constant: PADDING).isActive = true
            container?.leftAnchor.constraint(equalTo: leftAnchor, constant: PADDING).isActive = true
            container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -PADDING).isActive = true
            container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -PADDING).isActive = true
            
            myTitle?.translatesAutoresizingMaskIntoConstraints = false
            myTitle?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: PADDING).isActive = true
            myTitle?.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: PADDING).isActive = true
            myTitle?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: -PADDING).isActive = true
            myTitle?.widthAnchor.constraint(equalToConstant: 0).isActive = true
 
            
            myLabel?.translatesAutoresizingMaskIntoConstraints = false
            myLabel?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: PADDING).isActive = true
            myLabel?.leftAnchor.constraint(equalTo: myTitle.unsafelyUnwrapped.rightAnchor, constant: 0).isActive = true
            myLabel?.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: -PADDING).isActive = true
            myLabel?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: -PADDING).isActive = true
        } else {
            // Fallback on earlier versions
        }
    }
}
