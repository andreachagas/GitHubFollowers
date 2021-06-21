//
//  UIHelper.swift
//  GitHubFollowers
//
//  Created by Andrea Chagas on 21/6/21.
//

import UIKit

struct UIHelper {

    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width // total width of the screen
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2) // left and right padding, and middle spaces
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40) // label is 20 height, so gives a symetrical look
        
        return flowLayout
    }
}
