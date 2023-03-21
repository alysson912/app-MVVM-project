//
//  HomeViewModel.swift
//  app-MVVM
//
//  Created by ALYSSON DODO on 21/03/23.
//

import UIKit

class HomeViewModel {

    public var numberOfItemsInSection: Int {
        return 2
    }
    public func sizeForItemAt(indexPath: IndexPath, frame: CGRect) -> CGSize {
        if indexPath.row == 0 {
         return  CGSize(width: 120, height: frame.height)// se primeira cell tenha 120 mantenha essa proporção
        }else{
            return CGSize(width: frame.width - 120, height: frame.height) // caso contrario pegue a largura e diminua 120
        }
    }
}
