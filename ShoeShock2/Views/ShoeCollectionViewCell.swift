//
//  ShoeCollectionViewCell.swift
//  ShoeShock
//
//  Created by chris on 10/29/20.
//  Copyright © 2020 chrisbanning. All rights reserved.
//

import UIKit

class ShoeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var heartButton: UIButton! {
        didSet {
        heartButton.imageView?.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var newLabel: UILabel!
    
    func updateViews(product: Product) {
        productImage.image = UIImage(named: product.imageName)
        productTitle.text = product.title
        productPrice.text = product.price
        newLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
    }
    
    
}
