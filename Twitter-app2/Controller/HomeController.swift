//
//  ViewController.swift
//  Twitter-app2
//
//  Created by ahmed on 6/17/19.
//  Copyright © 2019 ahmed. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON


//MARK:- Identifier
let Cell1_Identifier = "cell_identifier"
let Cell2_identifier = "cell2_identifier"
let Header_Identifier = "header_identifier"
let Footer_identifier = "footer_identifier"

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var UserList: [User]!
    var TweetList: [Tweet]!
    var errLabel: UILabel = {
        let label = UILabel()
        label.text = "Apologize, some thing wrong!"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
    return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(errLabel)
        errLabel.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, topConstant: 50, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: 0, Height: 0)
        
        setUpNavItems() //setUpNavigationBar
        self.collectionView.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.9254901961, blue: 0.9450980392, alpha: 1)
        self.collectionView.register(UserCell.self, forCellWithReuseIdentifier: Cell1_Identifier)
        self.collectionView.register(tweetCell.self, forCellWithReuseIdentifier: Cell2_identifier)
        self.collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header_Identifier)
        self.collectionView.register(footerCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: Footer_identifier)
        
        Services.shared.fetchHomFeed { (err) in
            if let _ = err {
                    self.errLabel.isHidden = false
            }else{
                self.collectionView.reloadData()
            }
            
        }

    }
}
