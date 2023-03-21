//
//  StoryCollectionViewCell.swift
//  app-MVVM
//
//  Created by ALYSSON DODO on 21/03/23.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "StoryCollectionViewCell"
    
    //private var screen: StoryCardCollectionViewCellScreen = StoryCardCollectionViewCellScreen()
   // private var viewModel: StoryCardViewModel?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     //   configScreen()
      //  screen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
