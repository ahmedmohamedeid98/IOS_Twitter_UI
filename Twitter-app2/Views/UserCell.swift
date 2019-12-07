//
//  UserCell.swift
//  Twitter
//
//  Created by ahmed on 6/17/19.
//  Copyright © 2019 ahmed. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell{
    
    var profileImage: CachedImageView = {
        let image = CachedImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        //image.layer.masksToBounds = true
        image.clipsToBounds = true
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return label
    }()
    
    var followButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 6
        btn.layer.borderColor = #colorLiteral(red: 0.262745098, green: 0.6549019608, blue: 0.9568627451, alpha: 1)
        btn.layer.borderWidth = 1
        btn.setTitle("Follow", for: .normal)
        btn.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 0)
        btn.setTitleColor(#colorLiteral(red: 0.262745098, green: 0.6549019608, blue: 0.9568627451, alpha: 1), for: .normal)
        return btn
    }()
    
    var aboutUser: UITextView = {
        let post = UITextView()
        post.backgroundColor = .clear
        post.isEditable = false
        post.font = UIFont.systemFont(ofSize: 15)
        return post
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    func setupView(){
        addSubview(profileImage)
        addSubview(followButton)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(aboutUser)
        
        profileImage.anchor(topAnchor, left: leftAnchor, right: nil, bottom: nil, topConstant: 12, leftConstant: 12, rightConstant: 0, bottomConstant: 0, width: 50, Height: 50)
        
        followButton.anchor(profileImage.topAnchor, left: nil, right: rightAnchor, bottom: nil, topConstant: 0, leftConstant: 0, rightConstant: 12, bottomConstant: 0, width: 100, Height: 30)
        
        nameLabel.anchor(profileImage.topAnchor, left: profileImage.rightAnchor, right: followButton.leftAnchor, bottom: nil, topConstant: 0, leftConstant: 8, rightConstant: 8, bottomConstant: 0, width: 0, Height: 0)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, right: nameLabel.rightAnchor, bottom: nil, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: 0, Height: 0)
        
        aboutUser.anchor(followButton.bottomAnchor, left: nameLabel.leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 2, leftConstant: -4, rightConstant: 0, bottomConstant: 0, width: 0, Height: 0)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
