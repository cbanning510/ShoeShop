//
//  CartVC.swift
//  ShoeShock2
//
//  Created by chris on 10/30/20.
//

import UIKit

class CartVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var cartTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTable.dataSource = self
        cartTable.delegate = self
        print("product count: \(DataService.cart.products.count)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.cart.getProducts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCell {
            let product = DataService.cart.getProducts()[indexPath.row].product
            print("product is: \(product)")
            cell.updateViews(selectedProduct: product)
            return cell
        } else {
            print("shit")
            return ProductCell()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
