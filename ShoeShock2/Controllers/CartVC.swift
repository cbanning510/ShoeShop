//
//  CartVC.swift
//  ShoeShock2
//
//  Created by chris on 10/30/20.
//

import UIKit

class CartVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var cartTable: UITableView!
    @IBOutlet weak var totalItemsLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var totalPrice = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTable.dataSource = self
        cartTable.delegate = self
        totalItemsLabel.text = "Total \(DataService.cart.products.count) Items"
        for product in DataService.cart.getProducts() {
            print("\(product.product?.title): \(product.quantity)")
        }
        
        
        let currentCart = DataService.cart.getProducts()
        for item in currentCart {
            totalPrice += Double(item.product!.price)!
        }
        totalPriceLabel.text = "$" + String(format: "%.2f", totalPrice)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.cart.getProducts().count
    }
    
    @IBAction func purchasePressedBtn(_ sender: UIButton) {
        print("Purchase pressed!!!")
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCell {
            let product = DataService.cart.getProducts()[indexPath.row].product
            cell.updateViews(selectedProduct: product!)
            return cell
        } else {
            return ProductCell()
        }
    }
}
