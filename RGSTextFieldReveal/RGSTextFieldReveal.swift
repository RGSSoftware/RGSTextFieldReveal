//
//  UITextfieldReveal.swift
//  UITextfieldRevealSwift
//
//  Created by PC on 6/15/16.
//  Copyright © 2016 Randel Smith. All rights reserved.
//

import UIKit

class RGSTextFieldReveal: UIView {
    var placeholderButton: UIButton!
    var reveralView: UIView!
    var textField: UITextField!
    
    var reveralViewMinHeight: CGFloat = 2.0
    var reveralViewMaxHeight: CGFloat = 30.0
    
    var openDuration = 0.25
    var closeDuration = 0.3
    
    var isOpen = false
    
    private var reveralViewHeightContaint : NSLayoutConstraint!
    private var containerView : UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        placeholderButton = UIButton(type: .Custom)
        placeholderButton.titleLabel?.font = placeholderButton.titleLabel?.font.fontWithSize(16)
        placeholderButton.contentEdgeInsets = UIEdgeInsetsMake(0, 2, 0, 0)
        placeholderButton.addTarget(self, action: #selector(self.buttonTap(_:)), forControlEvents: .TouchUpInside)
        
        placeholderButton.translatesAutoresizingMaskIntoConstraints = false;
        
        self.addSubview(placeholderButton)
        
        placeholderButton.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        placeholderButton.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor).active = true
        placeholderButton.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor).active = true
        placeholderButton.heightAnchor.constraintEqualToConstant(30).active = true
        
        
        reveralView = UIView()
        reveralView.backgroundColor = UIColor.yellowColor()
        reveralView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(reveralView)
        
        
        reveralView.topAnchor.constraintEqualToAnchor(placeholderButton.bottomAnchor).active = true
        reveralView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor).active = true
        reveralView.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor).active = true
        reveralViewHeightContaint = reveralView.heightAnchor.constraintEqualToConstant(reveralViewMinHeight)
        reveralViewHeightContaint.active = true
        reveralView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
        
        
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        reveralView.addSubview(containerView)
        
        
        containerView.topAnchor.constraintEqualToAnchor(reveralView.topAnchor).active = true
        containerView.leadingAnchor.constraintEqualToAnchor(reveralView.leadingAnchor).active = true
        containerView.trailingAnchor.constraintEqualToAnchor(reveralView.trailingAnchor).active = true
        containerView.bottomAnchor.constraintEqualToAnchor(reveralView.bottomAnchor).active = true
        
        
        textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(textField)
        
        
        textField.leadingAnchor.constraintEqualToAnchor(containerView.leadingAnchor, constant: 2).active = true
        textField.trailingAnchor.constraintEqualToAnchor(containerView.trailingAnchor).active = true
        textField.centerYAnchor.constraintEqualToAnchor(containerView.centerYAnchor).active = true
        
        
        
        self.layer.masksToBounds = true
        self.reveralView.layer.cornerRadius = 1
        self.containerView.alpha = 0
        self.placeholderButton.contentHorizontalAlignment = .Left;
        self.backgroundColor = UIColor.clearColor()
        
    }
    
    func open() {
        self.textField.becomeFirstResponder()
        self.isOpen = true
        
        UIView.animateWithDuration(openDuration) {
            self.reveralViewHeightContaint.constant = self.reveralViewMaxHeight
            
            self.containerView.alpha = 1
            
            self.placeholderButton.titleLabel?.alpha = 0.5
            self.placeholderButton.titleLabel?.transform = CGAffineTransformScale(self.placeholderButton.transform, 0.8, 0.8)
            
            self.superview!.layoutIfNeeded()
        }
    }
    
    func close() {
        self.textField.resignFirstResponder()
        self.isOpen = false
        
        UIView.animateWithDuration(closeDuration) {
            self.reveralViewHeightContaint.constant = self.reveralViewMinHeight
            
            self.containerView.alpha = 0
            
            self.placeholderButton.titleLabel?.alpha = 1
            self.placeholderButton.titleLabel?.transform = CGAffineTransformScale(self.placeholderButton.transform, 1, 1)
            
            self.superview!.layoutIfNeeded()
        }
    }
    
    @objc private func buttonTap(button: UIButton) {
        if isOpen {
            self.close()
        } else {
            self.open()
        }
    }

}
