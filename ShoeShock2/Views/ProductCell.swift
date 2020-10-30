//
//  ProductTableViewCell.swift
//  ShoeShock2
//
//  Created by chris on 10/30/20.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    func updateViews(selectedProduct: Product) {
        productImage.image = UIImage(named: selectedProduct.imageName)
        productTitle.text = selectedProduct.title
        productPrice.text = selectedProduct.price
    }
}
