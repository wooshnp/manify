//
//  TextField.swift
//  ManufactureApp
//
//  Created by Nuno Pinho on 14/10/2019.
//  Copyright © 2019 Nuno Pinho. All rights reserved.
//

import UIKit


@IBDesignable class TextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var borderColor : UIColor = .black
    
    override func prepareForInterfaceBuilder() {
        commonInit()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func commonInit()
    {
        //boarders color and corners
        super.prepareForInterfaceBuilder()
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
        self.layer.opacity = 0.4
        
        
        //background
        self.backgroundColor = UIColor(white: 1, alpha: 1.0)
        
        //text
        
        
     
    }
    
  
}
