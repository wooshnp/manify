//
//  ConversationTableViewCell.swift
//  ManufactureApp
//
//  Created by Nuno Pinho on 23/10/2019.
//  Copyright © 2019 Nuno Pinho. All rights reserved.
//

import UIKit

struct Conversation {
    let name: String
    let time: String
    let message: String
    let image: UIImage
}

class ConversationTableViewCell: UITableViewCell {

    static let identifier = "ConversationTableViewCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet var userImage: [ImageUser]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func register(on tableView: UITableView)
    {
        let nib = UINib(nibName: identifier, bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: identifier)
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = 100
    }
    
    func configure(with item: Conversation)
    {
        self.nameLabel.text = item.name
        self.timeLabel.text = item.time
        self.messageLabel.text = item.message
        self.userImage.forEach { image in
            image.image = item.image
        }
        
        
    }
    
}
