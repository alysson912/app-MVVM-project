//
//  HomeViewModel.swift
//  app-MVVM
//
//  Created by ALYSSON DODO on 21/03/23.
//

import UIKit

class HomeViewModel {
    
    private var posts: [Posts] = []
    
    public var getListPosts: [Posts]{ // acessando objeto atravez de uma variave computada
        posts
    }
    
    private var story: [Stories]  = []
    
    public var getListStory: [Stories]{ // acessando objeto atravez de uma variave computada
        story
    }
    
    public var numberOfItemsInSection: Int {
        return  2
    }
    public func sizeForItemAt(indexPath: IndexPath, frame: CGRect) -> CGSize {
        if indexPath.row == 0 {
            return  CGSize(width: 120, height: frame.height)// se primeira cell tenha 120 mantenha essa proporção
        }else{
            return CGSize(width: frame.width - 120, height: frame.height) // caso contrario pegue a largura e diminua 120
        }
    }
}
