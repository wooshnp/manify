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

protocol Edit: class {
    func edit(old order: Order, to newOrder: Order)
    func delete(order: Order)
}


class EditMenuViewController: BaseViewController, Edit {
    func delete(order: Order) {
        if let index = self.ordersList.firstIndex(of: order){
            self.ordersList.remove(at: index)
            self.tableView.reloadData()
        }
    }
    
    func edit(old order: Order, to newOrder: Order) {
        
        if let index = self.ordersList.firstIndex(of: order){
            self.ordersList[index] = newOrder
            self.tableView.reloadData()
        }
    }
    

    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fanMenu: FanMenu!
    
    var ordersList = [
        Order(title: "Entrega de combustivel", description: "Entrega de combustivel feita no posto #3456 BP lda, apenas gasolina e gasolio aditivado. Remessas de 10 000L cada poste.", address: "R. do Bairro da Mina, 6000-032 Castelo Branco", date: Date(), type: .assignment, status: .waiting),
        Order(title: "Venda de pacote casa", description: "Pacote casa MEO40, com internet (100/100), TV (120 canais s/ box), chamadas internacionais com roaming ativo aut.", address: "", date: Date(), type: .sales, status: .closed),
        Order(title: "Mudança de casa", description: "Montagem do pacote unlimited, cliente ja tem box (mudanca de casa), PDO ja instalado na rua", address: "Rua Praceta Egas Manuel Valente, nº4, 1ºdrt", date: Date(), type: .tech, status: .inProgress)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Services"
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
        
        
        
        
        
        fanMenu.onItemDidClick = {  button in
            if button.id == "main" { return }
            
            let alert : UIAlertController!
            
            switch button.id {
                case "sells":
                    alert = UIAlertController(title: OrderType.sales.typeMessage, message: "Insert details", preferredStyle: .alert)
                    //textField with configurations
               case "orders":
                    alert = UIAlertController(title: OrderType.assignment.typeMessage, message: "Insert details", preferredStyle: .alert)
               case "tech":
                    alert = UIAlertController(title: OrderType.tech.typeMessage, message: "Insert details", preferredStyle: .alert)
               default:
                   alert = UIAlertController()
            }
            
                  
            alert.addTextField { textField in
                textField.placeholder = "Title"
                textField.font = .systemFont(ofSize: 20)
            }
            
            alert.addTextField { textField in
                textField.placeholder = "Description"
                textField.font = .systemFont(ofSize: 20)
            }
            
            alert.addTextField { textField in
                textField.placeholder = "Address"
                textField.font = .systemFont(ofSize: 20)
            }
                  
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                
                let title = alert.textFields?[0].text
                let description = alert.textFields?[1].text
                let address = alert.textFields?[2].text

                
                if title!.isEmpty || description!.isEmpty
                {
                    
                    let alertUnsuccess = UIAlertController(title: "Required fields missing", message: "Title and description are mandatory!", preferredStyle: .alert)
                    alertUnsuccess.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alertUnsuccess, animated: true, completion: nil)
                    
                }else{
                
                
                    switch button.id {
                       case "sells":
                        let saleOrder = Order(title: title ?? "", description: description ?? "", address: address ?? "", date: Date(), type: .sales, status: .waiting)
                           self.ordersList.append(saleOrder)
                       case "orders":
                        let ordersOrder = Order(title: title ?? "", description: description ?? "", address: address ?? "", date: Date(), type: .assignment, status: .waiting)
                           self.ordersList.append(ordersOrder)
                       case "tech":
                        let techOrder = Order(title: title ?? "", description: description ?? "", address: address ?? "", date: Date(), type: .tech, status: .waiting)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = OrderDetailViewController(order: self.ordersList[indexPath.row])
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
