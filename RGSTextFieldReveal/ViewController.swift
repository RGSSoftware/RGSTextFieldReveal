//
//  ViewController.swift
//  RGSTextFieldReveal
//
//  Created by PC on 6/15/16.
//  Copyright © 2016 Randel Smith rs@randelsmit.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstReveal: RGSTextFieldReveal!
    @IBOutlet weak var middleReveal: RGSTextFieldReveal!
    @IBOutlet weak var lastReveal: RGSTextFieldReveal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firstReveal.placeholderButton.setTitle("First", forState: .Normal)
        self.firstReveal.reveralViewMaxHeight = 80
        
        self.middleReveal.placeholderButton.setTitle("Middle", forState: .Normal)
        self.middleReveal.placeholderButton.removeTarget(nil, action: nil, forControlEvents: .AllEvents)
        self.middleReveal.placeholderButton.addTarget(self, action: #selector(self.reveal(_:)), forControlEvents: .TouchUpInside)
        
        self.lastReveal.placeholderButton.setTitle("Last", forState: .Normal)
    }
    
    func reveal(button: UIButton) {
        if self.middleReveal.isOpen {
            
            self.middleReveal.close()
            
        } else {
            self.middleReveal.open()
        }
    }
    



}

