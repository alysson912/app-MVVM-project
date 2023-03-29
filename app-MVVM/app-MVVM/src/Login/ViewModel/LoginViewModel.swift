//
//  LoginViewModel.swift
//  app-MVVM
//
//  Created by ALYSSON DODO on 29/03/23.
//

import UIKit
import FirebaseAuth

protocol loginViewModelProtocol: AnyObject {
    func successLogin()
    func errorLogin( errorMessage: String)
}
class LoginViewModel {
    
    private weak var delegate: loginViewModelProtocol?
    private var auth = Auth.auth()
    
    public func delegate( delegate: loginViewModelProtocol?){
        self.delegate = delegate
    }
    
    public func login( email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in // authResult = resultado da autenticacao
            if error == nil {
                print("sucesso login")
                self.delegate?.successLogin()
            } else {
                print("Error no login: \(error?.localizedDescription ?? "")")
                self.delegate?.errorLogin(errorMessage: error?.localizedDescription ?? "")
            }
        }
    }
    
    public func registerUser( email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in // authResult = resultado da autenticacao
            if error == nil {
                print("sucesso Cadastro")
            } else {
                print("Error no Cadastro: \(error?.localizedDescription ?? "")")
            }
            
        }
    }
    
    
}
