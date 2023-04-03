//
//  RegisterVCViewController.swift
//  LoginViewCode
//
//  Created by ALYSSON MENEZES on 17/05/22.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {

    var registerScreen: RegisterScreen?
    var auth : Auth?
    //var alert : Alert?
    
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
      //  self.alert = Alert(controller: self)
    }
}
     extension RegisterVC: UITextFieldDelegate {
         
         func textFieldDidEndEditing(_ textField: UITextField) {
             self.registerScreen?.validarTextFields()
         }
         
         func textFieldShouldReturn(_ texField: UITextField) -> Bool {
        texField.resignFirstResponder()
             
         return true
    }
}

extension RegisterVC: RegisterScreenProtocol {
    func actionBackButton() {
        
        let VC = LoginVC()
        let navVC = UINavigationController(rootViewController: VC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
    
    func actionRegisterButton() {

    }
    
    
}

