//
//  tweetCell.swift
//  Twitter-app2
//
//  Created by ahmed on 6/23/19.
//  Copyright © 2019 ahmed. All rights reserved.
//

import UIKit

class tweetCell: UICollectionViewCell {
    
    var replyBtn: UIButton = {
       let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    var retweetBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    var directMessageBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    var likeBtn: UIButton = {
        let btn = UIButton(type: .system)
        //withRenderingMode: Creates and returns a new image object with the specified rendering mode
        btn.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return btn
    }()
    
    var postTextView: UITextView = {
       let textView = UITextView()
        
        textView.text = "this for test test"
        return textView
    }()
    
    
    var profileImage: CachedImageView = {
        let image = CachedImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        //image.layer.masksToBounds = true
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupCellView()
        setupStackView()
    }
    
    func setupCellView(){
        addSubview(profileImage)
        addSubview(postTextView)
        
        profileImage.anchor(topAnchor, left: leftAnchor, right: nil, bottom: nil, topConstant: 12, leftConstant: 12, rightConstant: 0, bottomConstant: 0, width: 50, Height: 50)
        postTextView.anchor(topAnchor, left: profileImage.rightAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 4, leftConstant: 4, rightConstant: 12, bottomConstant: 0, width: 0, Height: 0)
        
    }
    
    func setupStackView(){
        
        let replayViewContainer = UIView()
        let retweetViewContainter = UIView()
        let directMessageViewContainter = UIView()
        let likeViewContainer = UIView()
        
        let stackView = UIStackView(arrangedSubviews: [replayViewContainer, retweetViewContainter, directMessageViewContainter, likeViewContainer])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        addSubview(stackView)
        addSubview(replyBtn)
        addSubview(retweetBtn)
        addSubview(directMessageBtn)
        addSubview(likeBtn)
        stackView.anchor(nil, left: postTextView.leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: 0, Height: 20)
        replyBtn.anchor(replayViewContainer.topAnchor, left: replayViewContainer.leftAnchor, right: nil, bottom: replayViewContainer.bottomAnchor, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: 20, Height: 0)
        retweetBtn.anchor(retweetViewContainter.topAnchor, left: retweetViewContainter.leftAnchor, right: nil, bottom: retweetViewContainter.bottomAnchor, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: 20, Height: 0)
        directMessageBtn.anchor(directMessageViewContainter.topAnchor, left: directMessageViewContainter.leftAnchor, right: nil, bottom: directMessageViewContainter.bottomAnchor, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: 20, Height: 0)
        likeBtn.anchor(likeViewContainer.topAnchor, left: likeViewContainer.leftAnchor, right: nil, bottom: likeViewContainer.bottomAnchor, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: 20, Height: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
