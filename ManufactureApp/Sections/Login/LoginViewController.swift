//
//  LoginViewController.swift
//  ManufactureApp
//
//  Created by Nuno Pinho on 09/10/2019.
//  Copyright © 2019 Nuno Pinho. All rights reserved.
//

import UIKit


class LoginViewController: BaseViewController {
    
    private var isEmailOK = false
    private var isPasswordOK = false
    
 
    @IBOutlet weak var loginButton: Buttons!
    
    
    
    //MARK: icon setup on textFields
    @IBOutlet weak var iconTextField: TextField! {
        didSet {
            iconTextField.tintColor = UIColor.lightGray
            iconTextField.setIcon(#imageLiteral(resourceName: "icons8-user-50"))
            iconTextField.attributedPlaceholder = NSMutableAttributedString(string: iconTextField.placeholder ?? " ", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "darkBlueColor")!])
        }
    }
    
  

    
    
    @IBOutlet weak var passwordTextField: TextField! {
        didSet {
            passwordTextField.isSecureTextEntry = true
            passwordTextField.tintColor = UIColor.lightGray
            passwordTextField.setIcon(#imageLiteral(resourceName: "icons8-lock-50"))
            passwordTextField.attributedPlaceholder = NSMutableAttributedString(string: passwordTextField.placeholder ?? " ", attributes:
                [NSAttributedString.Key.foregroundColor: UIColor(named: "darkBlueColor")!])
            }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.iconTextField.delegate = self
        //self.passwordTextField.delegate = self
        self.loginButton.isEnabled = false
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    
    
    @IBAction func loginWasPressed(_ sender: Any) {
  
        if iconTextField.text != "aaa", passwordTextField.text != "bbb" {
            let alert = UIAlertController(title: "Error", message: "Your email or password is incorrect! Please try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        } else {
            self.goToMain()
        }
    }
       
    
    
    //MARK: Register button when pressed
    @IBAction func registerWasPressed(_ sender: Any) {
        
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
        self.present(RegisterViewController(), animated: true)
            
    }
    
    @IBAction func forgotPasswordWasPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Forgot?", message: "Insert your email here:", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Email"
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            //CHECK EMAIL
            
            let email = alert.textFields?.first?.text
            
            if email == "aaa"{//Everything is alright
                let alertSuccess = UIAlertController(title: "Success", message: "Check your email inbox!", preferredStyle: .alert)
                alertSuccess.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertSuccess, animated: true, completion: nil)
                
            }else{ //IF NOT
                let alertUnsuccess = UIAlertController(title: "Email malformed", message: "Please try again", preferredStyle: .alert)
                       alertUnsuccess.addAction(UIAlertAction(title: "OK", style: .default))
                       self.present(alertUnsuccess, animated: true, completion: nil)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { action in
            print(action)
        }))
        
        self.present(alert, animated: true)
        
    }
    @IBAction func textFieldTextChanged(_ textField: TextField) {
        
        print("\(textField.tag) end editing")
               
               if(textField.tag == 10) //EMAIL
               {
                   //VALIDATE EMAIL
                if(!(textField.text?.isEmpty ?? false))
                   {
                       isEmailOK = true
                   }
                   else
                  {
                      isEmailOK = false

                  }
               }
               if(textField.tag == 11) //PASSWORD
               {
                   //VALIDATE PASSWORD
                if(!(textField.text?.isEmpty ?? false))
                   {
                       isPasswordOK = true
                   }
                   else
                   {
                       isPasswordOK = false
                   }
               }
               
               
               if isPasswordOK , isEmailOK {
                   self.loginButton.isEnabled = true
               }else{
                   self.loginButton.isEnabled = false

                
               }
        
    }
    
    private func goToMain(){
        guard let window = self.view.window else { return }
        let mainViewController = MainViewController()

        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromBottom
        window.layer.add(transition, forKey: nil)

        window.rootViewController = mainViewController
        window.makeKeyAndVisible()
    }
    
}
    //MARK: To set an left icon on textFields
    extension UITextField {
          
        func setIcon(_ image: UIImage) {
           let iconView = UIImageView(frame:
                          CGRect(x: 10, y: 5, width: 20, height: 20))
           iconView.image = image
           let iconContainerView: UIView = UIView(frame:
                          CGRect(x: 20, y: 0, width: 30, height: 30))
           iconContainerView.addSubview(iconView)
           leftView = iconContainerView
           leftViewMode = .always
        
        }
    
    
        //TODO
    //MARK: UIAlertView logic, textField + sucess msg
       
    
    
}

extension LoginViewController: UITextFieldDelegate{
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("\(textField.tag) end editing")

        if(textField.tag == 10) //EMAIL
        {
            //VALIDATE EMAIL
            if(textField.text == "aaa")
            {
                isEmailOK = true
            }
            else
           {
               isEmailOK = false

           }
        }
        if(textField.tag == 11) //PASSWORD
        {
            //VALIDATE PASSWORD
            if(textField.text == "bbb")
            {
                isPasswordOK = true
            }
            else
            {
                isPasswordOK = false

            }
        }


        if isPasswordOK , isEmailOK {
            self.loginButton.isEnabled = true
            
        }else{
            self.loginButton.isEnabled = false
            
        }

    }
    
    
    
}
