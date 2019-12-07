//
//  headerCell.swift
//  Twitter-app2
//
//  Created by ahmed on 6/18/19.
//  Copyright © 2019 ahmed. All rights reserved.
//

import UIKit

class HeaderCell: UICollectionViewCell{
    
    let whoLabel: UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    let speratorLine: UILabel = {
        let line = UILabel()
        line.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        backgroundColor = .white
        addSubview(speratorLine)
        speratorLine.anchor(nil, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0, width: 0, Height: 0.5)
        addSubview(whoLabel)
        whoLabel.anchor(topAnchor, left: leftAnchor, right: rightAnchor, bottom: speratorLine.topAnchor, topConstant: 0, leftConstant: 12, rightConstant: 0, bottomConstant: 0, width: 0, Height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
