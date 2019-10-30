//
//  EditMenuViewController.swift
//  ManufactureApp
//
//  Created by Nuno Pinho on 22/10/2019.
//  Copyright © 2019 Nuno Pinho. All rights reserved.
//

import UIKit
import FanMenu
import Macaw

class EditMenuViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fanMenu: FanMenu!
    
    var ordersList = [Order]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        OrdersTableViewCell.register(on: self.tableView)
        fanMenu.backgroundColor = .clear
        
      fanMenu.button = FanMenuButton(
          id: "main",
          image: "addSignal",
          color: Color(val: 0x273C75)
        )
        
        fanMenu.items = [
          FanMenuButton(
            id: "tech",
            image: "technical",
            color: Color(val: 0x273C75)
          ),
          FanMenuButton(
            id: "orders",
            image: "order",
            color: Color(val: 0x273C75)
          ),
          FanMenuButton(
            id: "sells",
            image: "sells",
            color: Color(val: 0x273C75)
            )
        ]
        
        
        
        
        
        fanMenu.onItemDidClick = { button in
          
            switch button.id {
                case "sells":
                    let saleOrder = Order(title: "testesaleOrder", description: "teste", date: Date(), type: .sales, status: .inProgress)
                    self.ordersList.append(saleOrder)
                case "orders":
                    let ordersOrder = Order(title: "testeordersOrder", description: "teste", date: Date(), type: .assignment, status: .inProgress)
                    self.ordersList.append(ordersOrder)
                case "tech":
                    let techOrder = Order(title: "testetechOrder", description: "teste", date: Date(), type: .tech, status: .inProgress)
                    self.ordersList.append(techOrder)
                default:
                    ()
            }
            
            self.tableView.reloadData()
        }
       
        
        // distance between button and items
        fanMenu.menuRadius = 75

        // animation duration
        fanMenu.duration = 0.35

        // menu opening delay
        fanMenu.delay = 0.05

        // interval for buttons in radians
        fanMenu.interval = (0, 3.0 * Double.pi)

        // menu background color
        fanMenu.menuBackground = Color.clear
      
        
    }

}

extension EditMenuViewController: UITableViewDelegate
{
    
}


extension EditMenuViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ordersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrdersTableViewCell.identifier, for: indexPath) as! OrdersTableViewCell
        cell.configure(with: self.ordersList[indexPath.row])
        return cell
    }
    
    
    
}
