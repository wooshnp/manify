//
//  RegisterViewController.swift
//  ManufactureApp
//
//  Created by Nuno Pinho on 09/10/2019.
//  Copyright © 2019 Nuno Pinho. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {

    @IBOutlet weak var getBack: UIButton!
    @IBOutlet weak var birthDate: TextField!
    
    private var datePicker : UIDatePicker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
    
        
        birthDate.textColor = .black
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(RegisterViewController.dateChanged(datePicker:)), for: .valueChanged)
    
        
        birthDate.inputView = datePicker
        
    }
    

    
    @objc func dateChanged(datePicker : UIDatePicker){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        birthDate.text = dateFormatter.string(from: datePicker.date)
        
        
    }


  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func closeWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
