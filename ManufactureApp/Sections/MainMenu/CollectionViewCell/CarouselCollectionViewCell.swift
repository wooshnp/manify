//
//  CarouselCollectionViewCell.swift
//  ManufactureApp
//
//  Created by Nuno Pinho on 21/10/2019.
//  Copyright © 2019 Nuno Pinho. All rights reserved.
//

import UIKit

struct CarouselItem {
    let image: UIImage
    let text: String
}

class CarouselCollectionViewCell: UICollectionViewCell {

    static let identifier = "CarouselCollectionViewCell"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    static func register(on collectionView: UICollectionView)
    {
        let nib = UINib(nibName: identifier, bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
        
    }

    
    func configure(with item: CarouselItem)
    {
        self.image.image = item.image
        self.label.text = item.text
        
    }
    
}
