//
//  BlurViewController.swift
//  KingFisherExample
//
//  Created by Yuji Sugaya on 2018/06/12.
//  Copyright © 2018年 Yuji Sugaya. All rights reserved.
//

import UIKit
import Kingfisher

class BlurViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!

    private enum ImagePattern {
        case blur(CGFloat)
        case noImage
        case foreverLoading
    }
    private let placeholderImage = UIImage(named: "NowLoading")
    private let images = [
            ImagePattern.blur(0), ImagePattern.blur(2), ImagePattern.blur(4),
            ImagePattern.blur(6), ImagePattern.blur(8), ImagePattern.blur(10),
            ImagePattern.blur(12), ImagePattern.blur(14), ImagePattern.blur(16),
            ImagePattern.blur(18), ImagePattern.noImage, ImagePattern.foreverLoading
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension BlurViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        switch images[indexPath.row] {
        case .blur(let blurRadius):
            let url = URL(string: "https://autolap.jp/img/Top1.jpg")
            let processor = BlurImageProcessor(blurRadius: blurRadius) // Blur with a radius
            cell.imageView.kf.setImage(with: url, placeholder: placeholderImage, options: [.transition(.fade(5.0)), .processor(processor)], progressBlock: nil, completionHandler: { (image, error, cachType, url) in
                cell.setErrorImageIfNeeded(error: error)
            })
            cell.titleLabel.text = "blurRadius: \(blurRadius)"
        case .noImage:
            let url = URL(string: "https://autolap.jp/") // No image
            cell.imageView.kf.setImage(with: url, placeholder: placeholderImage, completionHandler: { (image, error, cachType, url) in
                cell.setErrorImageIfNeeded(error: error)
            })
            cell.titleLabel.text = "No image"
        case .foreverLoading:
            let url = URL(string: "https://autolap.jp/") // No image and Do not set error image
            cell.imageView.kf.setImage(with: url, placeholder: placeholderImage)
            cell.titleLabel.text = "Forever loading"
        }
        return cell
    }
}
