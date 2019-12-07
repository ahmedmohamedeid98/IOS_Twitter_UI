//
//  HomeController+CollectionViewExt.swift
//  Twitter-app2
//
//  Created by ahmed on 7/8/19.
//  Copyright © 2019 ahmed. All rights reserved.
//

import UIKit

extension HomeController{
    
    //You can call this method at any time to update the layout information.
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            if let Users = Services.shared.UserList{
                return Users.count
            }else{
                return 0
            }
        }else{
            if let Tweets = Services.shared.tweetList{
                return Tweets.count
            }else{
                return 0
            }
        }
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell1_Identifier, for: indexPath) as? UserCell
            let currentUser = Services.shared.UserList[indexPath.row]
            cell?.nameLabel.text = currentUser.name
            cell?.usernameLabel.text = currentUser.username
            cell?.profileImage.loadImage(urlString: currentUser.profileImageUrl)
            cell?.aboutUser.text = currentUser.postText
            return cell!
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell2_identifier, for: indexPath) as? tweetCell
        let data = Services.shared.tweetList[indexPath.row]
        cell?.profileImage.loadImage(urlString: data.user.profileImageUrl)
        cell?.postTextView.attributedText = Tweet.messageAtrributor(name: data.user.name, userName: data.user.username, message: data.messageTextView)
        return cell!
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            guard let users = Services.shared.UserList else { return .zero }
            let user = users[indexPath.row]
            let estimateHeight = estimateHeightForText(text: user.postText)
            return CGSize(width: self.view.frame.width, height: estimateHeight + 66)
        }
        guard let tweets = Services.shared.tweetList else { return .zero }
        let tweet = tweets[indexPath.row]
        let estimateHeight = estimateHeightForText(text: tweet.messageTextView)
        return CGSize(width: self.view.frame.width, height: estimateHeight + 74)
        
        
    }
    private func estimateHeightForText(text:String) -> CGFloat{
        let size = CGSize(width: self.view.frame.width - 12 - 50 - 8 - 2, height: 1000)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        let estimateHeight = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return estimateHeight.height
        
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header_Identifier, for: indexPath) as? HeaderCell
            return header!
        }
        else{
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Footer_identifier, for: indexPath) as? footerCell
            
            return footer!
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: self.view.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1{
            return .zero
        }
        return CGSize(width: self.view.frame.width, height: 64)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
