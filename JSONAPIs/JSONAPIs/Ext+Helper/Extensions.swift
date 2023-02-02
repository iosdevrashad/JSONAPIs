//
//  Extensions.swift
//  JSONAPIs
//
//  Created by Rashad Surratt on 1/30/23.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
}

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}

extension UIView {
    func animate(view: UIView) {
        
        let newButtonWidth: CGFloat = 60
        let animator = UIViewPropertyAnimator(duration: 0.9, curve: .linear) { //1
            self.frame = CGRect(x: 0, y: 0, width: newButtonWidth, height: newButtonWidth)
            self.center = view.center
        }
        animator.startAnimation() //2
    }
}




