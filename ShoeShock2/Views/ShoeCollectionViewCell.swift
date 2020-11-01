//
//  ShoeCollectionViewCell.swift
//  ShoeShock
//
//  Created by chris on 10/29/20.
//  Copyright © 2020 chrisbanning. All rights reserved.
//

import UIKit

class ShoeCollectionViewCell: UICollectionViewCell {
    
    var productInCell: Product?
    var isHeartFilled = false
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var newLabel: UILabel!
    @IBOutlet weak var heartBtn: UIButton!
    
    func updateViews(product: Product) {
        heartBtn.setImage(UIImage(named: "icons8-heart-48"), for: .normal)
        isHeartFilled = false

        let currentCart = DataService.cart.getProducts()     
        
        for shoe in currentCart {
            if let shoeTitle = shoe.product?.title {
                if shoeTitle == product.title {
                    heartBtn.setImage(UIImage(named: "filledHeart"), for: .normal)
                    isHeartFilled = true
                }
            }
        }
        
        productInCell = product
        productImage.image = UIImage(named: product.imageName)
        productTitle.text = product.title
        productPrice.text = "$" + product.price
        newLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
    }
    
    @IBAction func heartPressed(_ sender: UIButton) {
        if !isHeartFilled {
            sender.setImage(UIImage(named: "filledHeart"), for: .normal)
            isHeartFilled = true
            DataService.cart.addProduct(product: productInCell!)
        } else {
            print("already in cart!!!")
        }
    }    
}
