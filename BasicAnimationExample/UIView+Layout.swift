//
//  UIView+Layout.swift
//  BasicAnimationExample
//
//  Created by Mohd Hafiz on 16/11/2022.
//

import UIKit

extension UIView {
    func fillSuperview(padding: CGFloat = 0, isSafeArea: Bool = false) {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = superview else { return }
        if isSafeArea {
            let safeArea = superview.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: padding),
                self.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -padding),
                self.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
                self.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            ])
        } else {
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: superview.topAnchor, constant: padding),
                self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -padding),
                self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding),
                self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -padding),
            ])
        }
    }
    
    func setEdge(top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil, trailing: CGFloat? = nil) {
        var constraints = [NSLayoutConstraint]()
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = superview else { return }
        if let top = top {
            constraints.append(self.topAnchor.constraint(equalTo: superview.topAnchor, constant: top))
        }
        if let leading = leading {
            constraints.append(self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leading))
        }
        if let bottom = bottom {
            constraints.append(self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottom))
        }
        if let trailing = trailing {
            constraints.append(self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: trailing))
        }
        NSLayoutConstraint.activate(constraints)
    }
    
    func setSize(width: CGFloat? = nil, height: CGFloat? = nil) {
        var constraints = [NSLayoutConstraint]()
        translatesAutoresizingMaskIntoConstraints = false
        if let width = width {
            constraints.append(self.widthAnchor.constraint(equalToConstant: width))
        }
        if let height = height {
            constraints.append(self.heightAnchor.constraint(equalToConstant: height))
        }
        NSLayoutConstraint.activate(constraints)
    }
    
    func centerX() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
        ])
    }
    
    func centerY() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ])
    }
    
    func center() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor)
        ])
    }
}
