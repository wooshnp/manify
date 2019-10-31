//
//  OrderEditViewController.swift
//  ManufactureApp
//
//  Created by Nuno Pinho on 31/10/2019.
//  Copyright © 2019 Nuno Pinho. All rights reserved.
//

import UIKit

class StatusEditTableViewCell: UITableViewCell
{
    static let identifier = "StatusEdiTableViewCell"
    let statusDescriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.statusDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.statusDescriptionLabel)
        self.statusDescriptionLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.statusDescriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.statusDescriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.statusDescriptionLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    static func register(on tableView: UITableView)
    {
        tableView.register(StatusEditTableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.rowHeight = 50
        tableView.estimatedRowHeight = 50
    }

    func configure(with status: OrderStatus)
    {
        self.statusDescriptionLabel.text = status.description
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.accessoryType = selected ? .checkmark : .none
    }
    
}



class OrderEditViewController: BaseViewController {
    
    @IBOutlet weak var titleTextField : UITextView!
    @IBOutlet weak var descriptionTextField : UITextView!
    @IBOutlet weak var addressTextField : UITextView!
    @IBOutlet weak var statusTableView : UITableView!


    var orderToEdit: Order!
    
    convenience init(order: Order) {
        self.init()
        self.orderToEdit = order
    }
    
    weak var delegate: EditData?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView(with: orderToEdit)
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveWasPressed))
        self.navigationItem.rightBarButtonItem = saveButton
        
        StatusEditTableViewCell.register(on: self.statusTableView)
        self.statusTableView.isScrollEnabled = false
        self.statusTableView.delegate = self
        self.statusTableView.dataSource = self
    }

    func configureView(with order: Order)
    {
        self.titleTextField.text = order.title
        self.descriptionTextField.text = order.description
        self.addressTextField.text = order.address
        
        self.titleTextField.layer.borderColor = UIColor.gray.cgColor
        self.descriptionTextField.layer.borderColor = UIColor.gray.cgColor
        self.addressTextField.layer.borderColor = UIColor.gray.cgColor
        
        
    }
    
    @objc func saveWasPressed(){
        
        self.delegate?.dataToEdit(title: titleTextField.text ?? "", description: descriptionTextField.text ?? "", address: addressTextField.text ?? "", status: OrderStatus.allCases[self.statusTableView.indexPathForSelectedRow!.row])
        self.navigationController?.popToRootViewController(animated: true)

        
    }

}


extension OrderEditViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension OrderEditViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OrderStatus.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StatusEditTableViewCell.identifier, for: indexPath) as! StatusEditTableViewCell
        cell.configure(with: OrderStatus.allCases[indexPath.row])
        
        if(self.orderToEdit.status == OrderStatus.allCases[indexPath.row])
        {
            
            self.statusTableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            
        }
        
        return cell
    }
    
    
}
