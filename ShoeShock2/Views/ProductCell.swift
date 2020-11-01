//
//  ProductTableViewCell.swift
//  ShoeShock2
//
//  Created by chris on 10/30/20.
//

import UIKit

protocol UpdateTable {
    func update()
}

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var stepperQuantity: UIStepper!
    
    var quantity = 0
    var currentProduct: Product?
    var updateTableDelegate: UpdateTable?
    
    @IBAction func updateQuantity(_ sender: UIStepper) {
        let quantityToSend = sender.value
        DataService.cart.updateCart(product: currentProduct!, quantity: quantityToSend)
        updateViews(selectedProduct: currentProduct!)
        updateTableDelegate?.update()
    }
    
    func updateViews(selectedProduct: Product) {
        currentProduct = selectedProduct
        quantity = 0
        let currentCartProducts = DataService.cart.getProducts()
        
        productImage.image = UIImage(named: selectedProduct.imageName)
        productImage.layer.cornerRadius = 8
        productTitle.text = selectedProduct.title
        
        for shoe in currentCartProducts {
            if shoe.product!.title == selectedProduct.title {
                quantityLabel.text = "Qty: \(shoe.quantity)"
                quantity = shoe.quantity
                stepperQuantity.value = Double(quantity)
            }
        }
        let individualShoePrice = Int(selectedProduct.price)!
        var totalShoePrice = 0
        totalShoePrice = individualShoePrice * quantity
        productPrice.text = "$" + String(format: "%.2f", Double(totalShoePrice))
    }
}
