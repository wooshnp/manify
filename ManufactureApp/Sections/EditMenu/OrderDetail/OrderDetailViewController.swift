//
//  OrderDetailViewController.swift
//  ManufactureApp
//
//  Created by Nuno Pinho on 31/10/2019.
//  Copyright © 2019 Nuno Pinho. All rights reserved.
//

import UIKit

protocol EditData: class {
    func dataToEdit(title: String, description: String, address: String, status: OrderStatus)
}

class OrderDetailViewController: BaseViewController, EditData {
    func dataToEdit(title: String, description: String, address: String, status: OrderStatus) {
        let editedOrder = Order(title: title, description: description, address: address, date: Date(), type: self.orderToEdit.type, status: status)
        self.delegate?.edit(old: self.orderToEdit, to: editedOrder)
    }
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusIndicator: UIView!
    
    weak var delegate: Edit?
    
    var orderToEdit: Order!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = orderToEdit?.title
        
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editWasPressed))
        self.navigationItem.rightBarButtonItem = editButton
        
        self.configureView(with: self.orderToEdit)
    }
    
    func configureView(with order: Order)
    {
        self.titleLabel.text = order.title
        self.descriptionLabel.text = order.description
        self.addressLabel.text = order.address
        self.statusLabel.text = order.status.description
        self.statusIndicator.backgroundColor = order.status.color
        self.statusIndicator.layer.borderColor = UIColor.gray.cgColor
    }


    convenience init(order: Order)
    {
        self.init()
        self.orderToEdit = order
    }
    
    @objc func editWasPressed()
    {
        let vc = OrderEditViewController(order: self.orderToEdit)
        vc.delegate = self
        self.navigationController?.pushViewController(vc , animated: true)
    }
    
    @IBAction func deleteWasPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Warning!", message: "Are you sure that you want to delete the order?", preferredStyle: .alert)
                 
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.delegate?.delete(order: self.orderToEdit)
            self.navigationController?.popViewController(animated: true)
        }))
       
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
       
        self.present(alert, animated: true)
    }
    
}
