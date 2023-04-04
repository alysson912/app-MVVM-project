//
//  ViewController.swift
//  LoginViewCode
//
//  Created by ALYSSON MENEZES on 14/05/22.
//

import UIKit

class LoginVC: UIViewController {
    
    private var loginScreen: LoginScreen?
    private var viewModel: LoginViewModel? = LoginViewModel()
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate( delegate:  self)
        loginScreen?.configTextFieldDelegate(delegate: self)
        viewModel?.delegate(delegate: self)
    }
}
extension LoginVC: LoginScreenProtocol{
    func tappedLoginButton() {
        viewModel?.login(email: loginScreen?.emailTextField.text ?? "", password: loginScreen?.passwordTextField.text ?? "")
    }
    
    func tappedRegisterButton() {
        let vc = RegisterVC()
       // vc.modalPresentationStyle = .fullScreen 
      //  present(vc, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginVC: LoginViewModelProtocol {
    func successLogin() {
        let vc: HomeVC = HomeVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    func errorLogin(errorMessage: String) {
        Alert(controller: self).showAlertInformation(title: "Atenção!", message: errorMessage)
    }
}

// return keyboard
extension LoginVC: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let email: String = loginScreen?.emailTextField.text ?? ""
        let password: String = loginScreen?.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.loginButton.backgroundColor = .darkGray
        } else {
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.loginButton.backgroundColor = .darkGray.withAlphaComponent(0.6)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
