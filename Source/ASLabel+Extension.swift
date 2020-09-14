//
//  ASLabel+Extension.swift
//  superapp
//
//  Created by Amit on 2/7/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

extension ASLabel {
    @discardableResult
    public func setTitleWidthWith(_ multiplier: Any?) -> ASLabel {
        if #available(iOS 9.0, *) {
            container?.asl_deactivateAllConstraints()
            container?.topAnchor.constraint(equalTo: topAnchor, constant: PADDING).isActive = true
            container?.leftAnchor.constraint(equalTo: leftAnchor, constant: PADDING).isActive = true
            container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -PADDING).isActive = true
            container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -PADDING).isActive = true
            
            myTitle?.asl_deactivateAllConstraints()
            myTitle?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: PADDING).isActive = true
            myTitle?.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: PADDING).isActive = true
            myTitle?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: -PADDING).isActive = true
            
            let widthAnchor: NSLayoutConstraint?
            if let multiplier = multiplier as? Double {
                widthAnchor = myTitle?.widthAnchor.constraint(equalTo: container.unsafelyUnwrapped.widthAnchor, multiplier: CGFloat(multiplier))
                widthAnchor?.isActive = true
            }else{
                widthAnchor = myTitle?.widthAnchor.constraint(equalTo: container.unsafelyUnwrapped.widthAnchor, multiplier: 0)
                widthAnchor?.isActive = true
            }
            
            
            myLabel?.asl_deactivateAllConstraints()
            myLabel?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: PADDING).isActive = true
            myLabel?.leftAnchor.constraint(equalTo: myTitle.unsafelyUnwrapped.rightAnchor, constant: 0).isActive = true
            myLabel?.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: -PADDING).isActive = true
            myLabel?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: -PADDING).isActive = true
        } else {
            // Fallback on earlier versions
        }
        
        return self
    }
}
