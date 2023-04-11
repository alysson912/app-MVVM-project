//
//  HomeViewModel.swift
//  app-MVVM
//
//  Created by ALYSSON DODO on 21/03/23.
//

import UIKit

class HomeViewModel {
    
    private var service = HomeService()
    private var posts = [Posts]()
    private var story = [Stories]()
    
    public var getListPosts: [Posts]{ // acessando objeto atraves de uma variavel computada
        posts
    }
    
    public var getListStory: [Stories]{ // acessando objeto atraves de uma variave computada
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
    public func fetchAllRequest(){
        service.getHomeDataJson { HomeData, error in
            if error == nil {
                self.posts = HomeData?.posts ?? []
                self.story = HomeData?.stories ?? []
            }
        }
    }
}
