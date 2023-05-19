//
//  UICollectionViewCell+Extension.swift
//  ZKFace
//
//  Created by Danna Lee on 2023/05/19.
//

import UIKit

extension UICollectionViewCell {
    func getCellIndexPath() -> IndexPath {
        let superView = self.superview as! UICollectionView
        let indexPath = superView.indexPath(for: self)
        return indexPath!
    }
}
