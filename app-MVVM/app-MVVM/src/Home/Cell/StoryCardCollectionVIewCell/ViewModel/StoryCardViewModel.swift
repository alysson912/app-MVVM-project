//
//  StoryCardViewModel.swift
//  app-MVVM
//
//  Created by ALYSSON DODO on 21/03/23.
//

import UIKit

class StoryCardViewModel {

    private var listStory :[Stories]
    
    init(listStory:[Stories]){
        self.listStory = listStory
    }
    
    public var numberOfItems: Int {
        return  listStory.count
    }
    
    func loudCurrentStory(indexPath: IndexPath) -> Stories {
        listStory[indexPath.row]
    }
}
