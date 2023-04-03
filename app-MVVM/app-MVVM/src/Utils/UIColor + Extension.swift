//
//  UIColor + Extension.swift
//  app-MVVM
//
//  Created by ALYSSON DODO on 21/03/23.
//

import Foundation
import UIKit

extension UIColor { // cores customizadas
    
    @nonobjc class var  appBackGround: UIColor {
        return UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)
    }
}


struct CustomColor {
    static let appLight:UIColor = UIColor(red: 239/255, green: 242/255, blue: 243/255, alpha: 1)
    static let appExtraLight:UIColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
    static let appPurple:UIColor = UIColor(red: 69/255, green: 82/255, blue: 255/255, alpha: 1)
    static let appPink:UIColor = UIColor(red: 255/255, green: 0/255, blue: 136/255, alpha: 1)
}

struct CustomFont {
    static let poppinsMedium = "Poppins-Medium"
    static let poppinsBold = "Poppins-Bold"
    static let poppinsSemiBold = "Poppins-SemiBold"
}
