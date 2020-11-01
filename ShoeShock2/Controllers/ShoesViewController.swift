//
//  ViewController.swift
//  ShoeShock2
//
//  Created by chris on 10/30/20.
//

import UIKit

let productCellNotificationKey = "com.chrisbanning/productCell"

class ShoesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, Test {
   
    @IBOutlet weak var shoesCollectionView: UICollectionView!
    @IBOutlet weak var shoeShockLabel: UILabel!
    @IBOutlet weak var cartButton: UIButton!    
    private(set) public var products = [Product]()
    
    let update = Notification.Name(rawValue: productCellNotificationKey)
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        products = DataService.instance.getShoes()
        shoesCollectionView.delegate = self
        shoesCollectionView.dataSource = self
        createObservers()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func cartButtonPressed(_ sender: UIButton) {
        //print("cart button pressed!!\n")
    }
    
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateTableView), name: update, object: nil)
    }
    // notification function
    @objc func updateTableView () {
        shoesCollectionView.reloadData()
    }
    
    func changeTitle(title: String) {
        shoeShockLabel.text = title
        shoesCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataService.instance.getShoes().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoeCollectionViewCell", for: indexPath) as? ShoeCollectionViewCell {
            let product = products[indexPath.row]
            cell.updateViews(product: product)
            cell.layer.cornerRadius = 8
            return cell
        } else {
            return ShoeCollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = DataService.instance.getShoes()[indexPath.row]
        performSegue(withIdentifier: "DetailsSegue", sender: product)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let DetailsVC = segue.destination as? DetailsViewController {
            DetailsVC.delegate = self
            if let product = sender as? Product {
                DetailsVC.product = product
            }
        }

    }
}

