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
        Conversation(name: "Eduardo Pires", time: "Thu", message: "Sim, claro!", image: #imageLiteral(resourceName: "person_6")),
        Conversation(name: "José Camarinha", time: "Wed", message: "Amanhã podemos fazer isso, caso ele apareça", image: #imageLiteral(resourceName: "person_1")),
        Conversation(name: "Sérgio Nunes", time: "Wed", message: "Done.", image: #imageLiteral(resourceName: "person_5")),
        Conversation(name: "Sérgio Nunes", time: "Wed", message: "Done.", image: #imageLiteral(resourceName: "person_5")),
        Conversation(name: "Sérgio Nunes", time: "Wed", message: "Done.", image: #imageLiteral(resourceName: "person_5")),
        Conversation(name: "Sérgio Nunes", time: "Wed", message: "Done.", image: #imageLiteral(resourceName: "person_5")),
        Conversation(name: "Sérgio Nunes", time: "Wed", message: "Done.", image: #imageLiteral(resourceName: "person_5"))
        
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
