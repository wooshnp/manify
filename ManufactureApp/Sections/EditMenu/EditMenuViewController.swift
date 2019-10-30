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
        
        
        
        
        
        fanMenu.onItemDidClick = { [weak self] button in
            guard let self = self else { return }
            if button.id == "main" { return }
            
            let alert : UIAlertController!
            
            switch button.id {
                case "sells":
                    alert = UIAlertController(title: OrderType.sales.typeMessage, message: "Insert details", preferredStyle: .alert)
               case "orders":
                    alert = UIAlertController(title: OrderType.assignment.typeMessage, message: "Insert details", preferredStyle: .alert)
               case "tech":
                    alert = UIAlertController(title: OrderType.tech.typeMessage, message: "Insert details", preferredStyle: .alert)
               default:
                   alert = UIAlertController()
            }
            
                  
            alert.addTextField { textField in
                textField.placeholder = "Title"
            }
            
            alert.addTextField { textField in
                textField.placeholder = "Description"
            }
            
            alert.addTextField { textField in
                textField.placeholder = "Address"
            }
                  
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {[weak self] action in
                guard let self = self else { return }
                
                let title = alert.textFields?[0].text
                let description = alert.textFields?[1].text
                let address = alert.textFields?[2].text

                
                if title!.isEmpty || description!.isEmpty
                {
                    
                    let alertUnsuccess = UIAlertController(title: "Email malformed", message: "Please try again", preferredStyle: .alert)
                    alertUnsuccess.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alertUnsuccess, animated: true, completion: nil)
                    
                }else{
                
                
                    switch button.id {
                       case "sells":
                        let saleOrder = Order(title: title ?? "", description: description ?? "", date: Date(), type: .sales, status: .waiting)
                           self.ordersList.append(saleOrder)
                       case "orders":
                        let ordersOrder = Order(title: title ?? "", description: description ?? "", date: Date(), type: .assignment, status: .waiting)
                           self.ordersList.append(ordersOrder)
                       case "tech":
                        let techOrder = Order(title: title ?? "", description: description ?? "", date: Date(), type: .tech, status: .waiting)
                           self.ordersList.append(techOrder)
                       default:
                           ()
                    }
                    
                    self.tableView.reloadData()
                }
            }))
              
              alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { action in
                  print(action)
              }))
              
              self.present(alert, animated: true)
        
            
          
           
            
            
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
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
           return UIView()
       }
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
