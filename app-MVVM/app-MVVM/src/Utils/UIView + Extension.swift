//
//  UIView + Extension.swift
//  app-MVVM
//
//  Created by ALYSSON DODO on 21/03/23.
//

import Foundation
import UIKit

extension UIView {
    
    //MARK: Zerando Constraints
    func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor),
        ])
    }
}
