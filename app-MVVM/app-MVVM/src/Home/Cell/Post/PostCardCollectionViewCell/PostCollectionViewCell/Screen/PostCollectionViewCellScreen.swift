//
//  PostCollectionViewCellScreen.swift
//  app-MVVM
//
//  Created by ALYSSON DODO on 23/03/23.
//

import UIKit

class PostCollectionViewCellScreen: UIView {

    lazy var cardView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.setCardShadow()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    lazy var likeImageView: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named:  "red-heart")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        let tap = UITapGestureRecognizer( target: self, action: #selector(tappedLikeImageView))
        tap.numberOfTapsRequired = 1
        img.addGestureRecognizer(tap)
        img.isUserInteractionEnabled = true
        //img.isHidden = true
        img.isHidden = false
        return img
    }()
    
    @objc func tappedLikeImageView(){
        
    }
    
    lazy var profileImageView: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "demo")
        img.clipsToBounds = true
        img.layer.cornerRadius = 15
        return img
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "name user "
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cardView)
        cardView.addSubview(likeImageView)
        cardView.addSubview(profileImageView)
        cardView.addSubview(userNameLabel)
        
        
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
        
            cardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            cardView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            likeImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 19),
            likeImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            likeImageView.heightAnchor.constraint(equalToConstant: 25),
            likeImageView.widthAnchor.constraint(equalToConstant: 25),
            
            profileImageView.heightAnchor.constraint(equalToConstant: 30),
            profileImageView.widthAnchor.constraint(equalToConstant: 30),
            profileImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 17),
            profileImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            
            userNameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 24),
            userNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: likeImageView.leadingAnchor, constant: -5),
            
            
            
        ])
    }
}
