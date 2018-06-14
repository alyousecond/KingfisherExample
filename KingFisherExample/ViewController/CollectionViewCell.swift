//
//  BlurCollectionViewCell.swift
//  KingFisherExample
//
//  Created by Yuji Sugaya on 2018/06/12.
//  Copyright © 2018年 Yuji Sugaya. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!

    private let noImage = UIImage(named: "NoImage")
    
    func setErrorImageIfNeeded(error: NSError?) {
        if error != nil { imageView.image = noImage }
    }
}
