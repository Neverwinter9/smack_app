//
//  RoundedButton.swift
//  Smack
//
//  Created by Pavel Ponomarev on 12/21/18.
//  Copyright © 2018 Pavel Ponomarev. All rights reserved.
//

import UIKit

@IBDesignable   //to see UI changes in Storyboard
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }
    
}
