//
//  ImageUser.swift
//  ManufactureApp
//
//  Created by Nuno Pinho on 14/10/2019.
//  Copyright © 2019 Nuno Pinho. All rights reserved.
//

import UIKit

@IBDesignable class ImageUser: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var image : UIImage?
    
    var imageView: UIImageView = UIImageView()
    
    override func prepareForInterfaceBuilder() {
        self.commonInit()
        //self.imageRound?.clipsToBounds = true
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func commonInit(){
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    
    func applyShaddow(){
        self.layer.shadowPath =
            UIBezierPath(roundedRect: self.bounds,
                         cornerRadius: imageView.layer.cornerRadius).cgPath
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 4.0
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.masksToBounds = false
        
    }
    
    func drawImage(){
        imageView.frame = CGRect(x: 0.0, y: 0.0, width: self.bounds.width, height: self.bounds.height)
        self.addSubview(imageView)
        imageView.image = self.image
        imageView.contentMode = self.contentMode
        imageView.layer.cornerRadius = self.layer.cornerRadius
        imageView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawImage()
        applyShaddow()

    }
 
}
