//
//  HomeScreen.swift
//  app-MVVM
//
//  Created by ALYSSON DODO on 21/03/23.
//

import UIKit



class HomeScreen: UIView {

    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        // to do: register
        cv.register(StoryCardCollectionViewCell.self, forCellWithReuseIdentifier: StoryCardCollectionViewCell.identifier)
        cv.backgroundColor = .clear
        
        return cv
    }()
    
    public func configProtocolsCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource){
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .appBackGround // cor criada la na extension
        configViews()
        configConstraints()
    }
    
    
    private func  configViews(){
        addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        
        collectionView.pin(to: self) // extension para zerar constraints
        NSLayoutConstraint.activate([
        
            
        ])
    }
}
