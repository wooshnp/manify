//
//  Buttons.swift
//  ManufactureApp
//
//  Created by Nuno Pinho on 14/10/2019.
//  Copyright © 2019 Nuno Pinho. All rights reserved.
//

import UIKit

@IBDesignable class Buttons: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var buttonColr : UIColor = .black
    
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
        
        self.backgroundColor = .clear
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(named: "darkBlueColor")?.cgColor
//        self.backgroundColor = UIColor.blue
        
        self.backgroundColor = UIColor.init(displayP3Red: 39/255, green: 60/255, blue: 117/255, alpha: 1.0)
        
       }
       

}
