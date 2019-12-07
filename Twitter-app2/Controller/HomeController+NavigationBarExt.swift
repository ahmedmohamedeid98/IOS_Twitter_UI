//
//  HomeController+NavigationBarExt.swift
//  Twitter-app2
//
//  Created by ahmed on 7/8/19.
//  Copyright © 2019 ahmed. All rights reserved.
//

import UIKit

extension HomeController{
    
    func setUpNavItems(){
        
        let titleImage = UIImageView(image:#imageLiteral(resourceName: "title_icon").withRenderingMode(.alwaysOriginal) )
        titleImage.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImage.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImage
        
        
        let followBarButton = UIButton(type: .system)
        followBarButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followBarButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        followBarButton.contentMode = .scaleAspectFit
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followBarButton)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.contentMode = .scaleAspectFit
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        searchButton.contentMode = .scaleAspectFit
        navigationItem.rightBarButtonItems = [ UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.shadowImage = UIImage()
        //navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navBarSperatorView = UIView()
        navBarSperatorView.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
        view.addSubview(navBarSperatorView)
        navBarSperatorView.anchor(view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: 0, Height: 0.5)
        
        
        
        
    }
}

