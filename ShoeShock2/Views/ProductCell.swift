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
    @IBOutlet weak var quantityLabel: UILabel!
    
    func updateViews(selectedProduct: Product) {
        let products = DataService.cart.getProducts()
        productImage.image = UIImage(named: selectedProduct.imageName)
        productTitle.text = selectedProduct.title
        productPrice.text = "$" + selectedProduct.price
        for shoe in products {
            if shoe.product!.title == selectedProduct.title {
                quantityLabel.text = "Qty: \(shoe.quantity)"
            }
        }
    }
}
