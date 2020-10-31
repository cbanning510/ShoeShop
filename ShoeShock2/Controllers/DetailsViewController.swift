//
//  DetailsViewController.swift
//  ShoeShock2
//
//  Created by chris on 10/30/20.
//

import UIKit

protocol Test {
    func changeTitle(title: String)
}

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addToCartBtn: UIButton!
    @IBOutlet weak var horizontalLine: UIView!
    
    var imageUrl: String?
    var product: Product?    
    var delegate: Test?
    
    @IBAction func cartBtnPressed(_ sender: Any) {
        guard let product = product else { return }
        DataService.cart.addProduct(product: product)
        delegate?.changeTitle(title: "ShoeShock")
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let product = product {
            shoeImage.image = UIImage(named: product.imageName)
            shoeNameLabel.text = product.title
            priceLabel.text = product.price
            descriptionLabel.text = product.description
            addToCartBtn.layer.cornerRadius = 6
        }
    }

}

