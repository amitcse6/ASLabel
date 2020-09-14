//
//  UIView+Extension.swift
//  ASLabel
//
//  Created by Amit on 14/9/20.
//

import Foundation
import UIKit

// MARK: - Swift 4
extension UIView {
    func asl_deactivateImmediateConstraints(){
        NSLayoutConstraint.deactivate(self.asl_immediateConstraints)
    }
    func asl_deactivateAllConstraints() {
        NSLayoutConstraint.deactivate(self.asl_allConstraints)
        translatesAutoresizingMaskIntoConstraints = false
    }
    var asl_immediateConstraints:[NSLayoutConstraint]{
        let constraints = self.superview?.constraints.filter{
            $0.firstItem as? UIView === self || $0.secondItem as? UIView === self
            } ?? []
        return self.constraints + constraints
    }
    var asl_allConstraints:[NSLayoutConstraint] {
        var view: UIView? = self
        var constraints:[NSLayoutConstraint] = []
        while let currentView = view {
            constraints += currentView.constraints.filter {
                return $0.firstItem as? UIView === self || $0.secondItem as? UIView === self
            }
            view = view?.superview
        }
        return constraints
    }
}
