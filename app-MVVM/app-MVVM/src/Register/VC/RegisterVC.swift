//
//  RegisterVCViewController.swift
//  LoginViewCode
//
//  Created by ALYSSON MENEZES on 17/05/22.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {
    
    private var registerScreen: RegisterScreen?
    private var viewModel: RegisterViewModel = RegisterViewModel()
    
    
    override func loadView() {
        registerScreen = RegisterScreen()
        view = registerScreen
    }
    
    override func viewWillAppear(_ animated: Bool) { // hide navigation controller 
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.configTextFieldDelegate(delegate: self)
        registerScreen?.delegate(delegate: self)
        viewModel.delegate(delegate: self)
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

      //  navigationController?.pushViewController(vc, animated: true)
        navigationController?.popViewController(animated: true)
       // navVC.modalPresentationStyle = .fullScreen
      //  self.present(navVC, animated: true, completion: nil)
    }
    
    func actionRegisterButton() {
        viewModel.registerUser(email: registerScreen?.emailTextField.text ?? "", password: registerScreen?.passwordTextField.text ?? "")
    }
}

extension RegisterVC: RegisterViewModelProtocol {
    func successRegister() {
        let VC = HomeVC()
        VC.modalPresentationStyle = .fullScreen
        self.present(VC, animated: true, completion: nil)
    }
    
    func errorRegister(errorMessage: String) {
        Alert(controller: self).showAlertInformation(title: "Error ao Registrar", message: errorMessage)
    }
}
