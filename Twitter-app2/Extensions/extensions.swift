//
//  extension.swift
//  Twitter
//
//  Created by ahmed on 6/17/19.
//  Copyright © 2019 ahmed. All rights reserved.
//

import UIKit

extension UIView{
    
    func anchor(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, rightConstant:CGFloat = 0, bottomConstant:CGFloat = 0, width: CGFloat = 0, Height: CGFloat = 0){
        translatesAutoresizingMaskIntoConstraints = false
        executeConstraint(top: top, left: left, right: right, bottom: bottom, topConstant: topConstant, leftConstant: leftConstant, rightConstant: rightConstant, bottomConstant: bottomConstant, width: width, Height: Height)
        
        
    }
    func executeConstraint(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, right: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, topConstant: CGFloat, leftConstant: CGFloat, rightConstant:CGFloat, bottomConstant:CGFloat, width: CGFloat, Height: CGFloat){
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top{
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        if let left = left{
            anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
        }
        if let right = right{
            anchors.append(rightAnchor.constraint(equalTo: right, constant: rightConstant * -1))
        }
        if let bottom = bottom{
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: bottomConstant * -1))
        }
        if width  > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: width))
        }
        if Height > 0{
            anchors.append(heightAnchor.constraint(equalToConstant: Height))
        }
        
        NSLayoutConstraint.activate(anchors)
    }
    
}
