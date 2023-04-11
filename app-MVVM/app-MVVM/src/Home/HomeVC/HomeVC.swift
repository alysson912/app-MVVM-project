//
//  ViewController.swift
//  app-MVVM
//
//  Created by ALYSSON DODO on 21/03/23.
//

import UIKit

class HomeVC: UIViewController {
    
    private var homeScreen: HomeScreen?
    private var viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate(delegate: self)
        viewModel.fetchAllRequest()
    }
    
    
}
extension HomeVC: HomeViewModelProtocol{
    func success() {
        print(#function)//após finalizar todos os processos do app, volta para thred principal,e execute essa alteração, alteracao forcada na UI
        DispatchQueue.main.async {
            self.homeScreen?.configProtocolsCollectionView(delegate: self, dataSource: self)
        }
    }
    
    func error() {
        print(#function)
    }
    
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.row == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCardCollectionViewCell.identifier, for: indexPath)as? StoryCardCollectionViewCell
            cell?.setupCell(listStory: viewModel.getListStory)
            
            return cell ?? UICollectionViewCell()
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCardCollectionViewCell.identifier, for: indexPath) as? PostCardCollectionViewCell
            cell?.setupCell(listPosts: viewModel.getListPosts)
            return cell ?? UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.sizeForItemAt(indexPath: indexPath, frame: collectionView.frame)
    }
    
    
}
