//
//  CustomCollectionViewFlowLayout.swift
//  SampleNewlineView
//
//  Created by fjsw on 2020/07/10.
//  Copyright © 2020 com.example. All rights reserved.
//

import UIKit

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {
    let cellSpacing: CGFloat = 28
 
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        self.minimumLineSpacing = 5
        self.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let attributes = super.layoutAttributesForElements(in: rect)
        
        
        var leftMargin = sectionInset.left
        var maxY: CGFloat = 0
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }
            layoutAttribute.frame.origin.x = leftMargin
            leftMargin += layoutAttribute.frame.width + cellSpacing
            maxY = max(layoutAttribute.frame.maxY, maxY)
        }
        return attributes
    }
}
