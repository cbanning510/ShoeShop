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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTable.dataSource = self
        cartTable.delegate = self
        totalItemsLabel.text = "Total \(DataService.cart.products.count) Items"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.cart.getProducts().count
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
