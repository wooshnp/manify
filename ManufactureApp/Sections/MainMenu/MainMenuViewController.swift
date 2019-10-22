//
//  MainMenuViewController.swift
//  ManufactureApp
//
//  Created by Nuno Pinho on 09/10/2019.
//  Copyright © 2019 Nuno Pinho. All rights reserved.
//

import UIKit

class MainMenuViewController: BaseViewController {

    @IBOutlet weak var carouselCollectionView: UICollectionView!
    
    let carouselItems = [
        CarouselItem(image: #imageLiteral(resourceName: "background_1"), text: "Ord. Vendas"),
        CarouselItem(image: #imageLiteral(resourceName: "background_2"), text: "Prob. Técnicos"),
        CarouselItem(image: #imageLiteral(resourceName: "background_3"), text: "Ord. Despacho"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        CarouselCollectionViewCell.register(on: self.carouselCollectionView)
        
        self.carouselCollectionView.delegate = self
        self.carouselCollectionView.dataSource = self
        
    }

    

    
    // MARK: - Navigation

    @IBAction func closedWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


extension MainMenuViewController: UICollectionViewDelegate
{
    
    
}

extension MainMenuViewController: UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
}


extension MainMenuViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.identifier, for: indexPath) as! CarouselCollectionViewCell
        cell.configure(with: carouselItems[indexPath.row])
        return cell
    }
    
    
    
}
