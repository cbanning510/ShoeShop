//
//  CartVC.swift
//  ShoeShock2
//
//  Created by chris on 10/30/20.
//

import UIKit

class CartVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UpdateTotals {
    func updateTotalItemCountAndPrice() {
        currentCart = DataService.cart.getProducts()
        totalPrice = 0.0
        totalItemCount = 0
        updateTotals()
        cartTable.reloadData()
    }

    @IBOutlet weak var cartTable: UITableView!
    @IBOutlet weak var totalItemsLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var purchaseBtn: UIButton!
    
    var totalPrice = 0.0
    var totalItemCount = 0
    var currentCart: [SelectedProduct]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        currentCart = DataService.cart.getProducts()
        cartTable.dataSource = self
        cartTable.delegate = self
        purchaseBtn.layer.cornerRadius = 6
        updateTotals()
    }
    
    func updateTotals() {
        for item in currentCart! {
            totalItemCount += item.quantity
            totalPrice += (Double(item.product!.price)! * Double(item.quantity))
        }
        totalItemsLabel.text = "Total \(totalItemCount) Items"
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
            cell.totalsDelegate = self
            let product = DataService.cart.getProducts()[indexPath.row].product
            cell.updateViews(selectedProduct: product!)
            return cell
        } else {
            return ProductCell()
        }
    }
}
