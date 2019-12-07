//
//  footerCell.swift
//  Twitter-app2
//
//  Created by ahmed on 6/18/19.
//  Copyright © 2019 ahmed. All rights reserved.
//

import UIKit

class footerCell: UICollectionViewCell{
    
    
    let showmoreLabel: UILabel = {
        let lab = UILabel()
        lab.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        lab.text = "Show me more"
        lab.textAlignment = .left
        return lab
    }()
   
    let speratorLine: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.9254901961, blue: 0.9450980392, alpha: 1)
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(showmoreLabel)
        addSubview(speratorLine)
        
        showmoreLabel.anchor(topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 0, leftConstant: 12, rightConstant: 0, bottomConstant: 12, width: 0, Height: 0)
        
        speratorLine.anchor(nil, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: 0, Height: 14)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
