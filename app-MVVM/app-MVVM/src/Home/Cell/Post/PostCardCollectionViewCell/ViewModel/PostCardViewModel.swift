//
//  PostCardViewModel.swift
//  app-MVVM
//
//  Created by ALYSSON DODO on 23/03/23.
//

import UIKit

class PostCardViewModel {
    
    private var listPosts :[Posts]
    
    init(listPosts:[Posts]){
        self.listPosts = listPosts
    }
    
    public var numberOfItems: Int {
        return  listPosts.count
    }
    
    func loudCurrentStory(indexPath: IndexPath) -> Posts {
        listPosts[indexPath.row]
    }
}


