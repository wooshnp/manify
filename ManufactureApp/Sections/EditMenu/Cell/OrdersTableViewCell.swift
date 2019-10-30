//
//  OrdersTableViewCell.swift
//  ManufactureApp
//
//  Created by Nuno Pinho on 23/10/2019.
//  Copyright © 2019 Nuno Pinho. All rights reserved.
//

import UIKit

enum OrderStatus {
    case inProgress
    case closed
    
    var color: UIColor
    {
        switch self {
            case .closed:
                return .green
            case .inProgress:
                return .yellow
        }
    }
    
}

enum OrderType{
    
    case sales
    case assignment
    case tech
    
    var image: UIImage{
        
        switch self {
            case .sales:
                return #imageLiteral(resourceName: "sells")
            case .assignment:
                return #imageLiteral(resourceName: "order")
            case .tech:
                return #imageLiteral(resourceName: "technical")
        }
        
    }
    
}

struct Order {
    let title: String
    let description: String
    let date: Date
    let type: OrderType
    let status: OrderStatus
}

class OrdersTableViewCell: UITableViewCell {
    
    static let identifier = "OrdersTableViewCell"
    
    @IBOutlet weak var orderImage: UIImageView!
    @IBOutlet weak var orderTitle: UILabel!
    @IBOutlet weak var orderDate: UILabel!
    @IBOutlet weak var orderDescription: UILabel!
    @IBOutlet weak var orderStatus: UIView!

    
    static func register(on tableView: UITableView)
    {
        let nib = UINib(nibName: identifier, bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: identifier)
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = 100
    }

    override func awakeFromNib() {
        super.awakeFromNib()
                self.orderStatus.layer.cornerRadius = 40 / 2

    }

    func configure(with order: Order)
    {
        self.orderTitle.text = order.title
        self.orderDescription.text = order.description
        self.orderImage.image = order.type.image
        self.orderImage.tintColor = .black
        self.orderStatus.backgroundColor = order.status.color
        
        
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "dd/MM/yyyy"
        let date = formatter.string(from: order.date)
        self.orderDate.text = date
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundOrderStatus()
    }
    
    
    
    func roundOrderStatus()
    {
        self.orderStatus.layer.borderWidth = 1
        self.orderStatus.layer.borderColor = UIColor.gray.cgColor
        self.orderStatus.layer.cornerRadius = 40 / 2
        self.orderStatus.layer.masksToBounds = true

    }
}
