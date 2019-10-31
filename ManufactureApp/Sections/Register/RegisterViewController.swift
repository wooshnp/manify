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
    
    
    @IBOutlet weak var birthDate: TextField! {
        didSet {
            birthDate.tintColor = UIColor.lightGray
            birthDate.setIcon(#imageLiteral(resourceName: "baseline_calendar_today_black_18dp-1"))
            birthDate.attributedPlaceholder = NSMutableAttributedString(string: birthDate.placeholder ?? " ", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "darkBlueColor")!])
                    }
        
    }
    
    @IBOutlet weak var phoneNumber: TextField! {
        didSet {
            phoneNumber.tintColor = UIColor.lightGray
            phoneNumber.setIcon(#imageLiteral(resourceName: "baseline_smartphone_black_18dp-1"))
            phoneNumber.attributedPlaceholder = NSMutableAttributedString(string: phoneNumber.placeholder ?? " ", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "darkBlueColor")!])
                      }
    }
    
    @IBOutlet weak var firstName: TextField! {
        didSet {
            firstName.tintColor = UIColor.lightGray
            firstName.setIcon(#imageLiteral(resourceName: "icons8-user-50"))
            firstName.attributedPlaceholder = NSMutableAttributedString(string: firstName.placeholder ?? " ", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "darkBlueColor")!])
               }
    }
    
    @IBOutlet weak var lastName: TextField! {
        didSet {
        lastName.tintColor = UIColor.lightGray
        lastName.setIcon(#imageLiteral(resourceName: "icons8-user-50"))
        lastName.attributedPlaceholder = NSMutableAttributedString(string: lastName.placeholder ?? " ", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "darkBlueColor")!])
           }
    }
    
    @IBOutlet weak var usrEmail: TextField! {
        didSet {
               usrEmail.tintColor = UIColor.lightGray
               usrEmail.setIcon(#imageLiteral(resourceName: "baseline_email_black_18dp-1"))
               usrEmail.attributedPlaceholder = NSMutableAttributedString(string: usrEmail.placeholder ?? " ", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "darkBlueColor")!])
                  }
    }
    
    
    var iconClick = true
    private var datePicker : UIDatePicker?
    
    @IBAction func iconAction(_ sender: AnyObject) {
        
        if iconClick == true {
            usrPwd.isSecureTextEntry = false
        } else {
            usrPwd.isSecureTextEntry = true
        }
        
        iconClick = !iconClick
        
    }
    
    
    @IBOutlet weak var usrPwd: TextField! {
        didSet {
            usrPwd.tintColor = UIColor.lightGray
            usrPwd.setIcon(#imageLiteral(resourceName: "icons8-lock-50"))
            usrPwd.attributedPlaceholder = NSMutableAttributedString(string: usrPwd.placeholder ?? " ", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "darkBlueColor")!])
                         }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
    
        phoneNumber.keyboardType = .asciiCapableNumberPad
        
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

    
    
    private func goToLogin(){
        guard let window = self.view.window else { return }
        let loginViewController = LoginViewController()

        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromBottom
        window.layer.add(transition, forKey: nil)

        window.rootViewController = loginViewController
        window.makeKeyAndVisible()
        
        
    }
    
    @IBAction func registerWasPressed(_ sender: Any) {
        if usrPwd.text?.isEmpty ?? true || birthDate.text?.isEmpty ?? true || phoneNumber.text?.isEmpty ?? true || firstName.text?.isEmpty ?? true || lastName.text?.isEmpty ?? true
        {
                           
            let alertUnsuccess = UIAlertController(title: "Required fields missing", message: "Please fill all the fields!", preferredStyle: .alert)
            alertUnsuccess.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertUnsuccess, animated: true, completion: nil)
            
        } else {
             self.goToLogin()
            
        }
        
    }
    
    // MARK : validate number length , validate email
    
    @IBAction func closeWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
