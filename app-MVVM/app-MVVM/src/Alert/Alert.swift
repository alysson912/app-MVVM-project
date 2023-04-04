//
//  Alert.swift
//  PrimeiroAppMVVM
//
//  Created by Caio Fabrini on 11/10/22.
//

import UIKit

class Alert {
    
    private let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    public func showAlertInformation(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default)
        alertController.addAction(ok)
        controller.present(alertController, animated: true)
    }

    public func succesRegister(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let back = UIAlertAction(title: "voltar", style: .cancel)
        alertController.addAction(back) 
        controller.present(alertController, animated: true)
    }
}
