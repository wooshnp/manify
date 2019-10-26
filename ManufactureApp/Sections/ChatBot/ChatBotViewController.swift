//
//  ChatBotViewController.swift
//  ManufactureApp
//
//  Created by Nuno Pinho on 22/10/2019.
//  Copyright © 2019 Nuno Pinho. All rights reserved.
//

import UIKit

class ChatBotViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let conversation = [
        Conversation(name: "João Isento", time: "9:00 AM", message: "Chega aqui sff", image: #imageLiteral(resourceName: "person_4")),
        Conversation(name: "António Costa", time: "8:00 AM", message: "Onde é que tu andas a esta hora crl!?!?!", image: #imageLiteral(resourceName: "person_2")),
        Conversation(name: "Eduardo Pires", time: "15:00 PM", message: "Sim, claro!", image: #imageLiteral(resourceName: "person_6")),
        Conversation(name: "Marco Martins", time: "19,24 PM", message: "Amanhã podemos fazer isso, caso ele apareça", image: #imageLiteral(resourceName: "person_1")),
        Conversation(name: "Sérgio Nunes", time: "Wed", message: "Ordens de despacho, ja estão todas fechadas.", image: #imageLiteral(resourceName: "person_5")),
        Conversation(name: "Ana Catarina", time: "Thu", message: "A venda está fechada", image: #imageLiteral(resourceName: "person_11")),
        Conversation(name: "Marta Rute", time: "Wed", message: "Rua Quinta da Granja, nº1, 2ºesq.", image: #imageLiteral(resourceName: "person_7")),
        Conversation(name: "Fábio Barata", time: "Mon", message: "Verifica pfv", image: #imageLiteral(resourceName: "person_9")),
        Conversation(name: "Ricardo Gomes", time: "Fri", message: "Status das vendas ?", image: #imageLiteral(resourceName: "person_10"))
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        ConversationTableViewCell.register(on: self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.showsVerticalScrollIndicator = false

        // Do any additional setup after loading the view.
    }

   
    

}

extension ChatBotViewController: UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}


extension ChatBotViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConversationTableViewCell.identifier) as! ConversationTableViewCell
        cell.configure(with: self.conversation[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}
