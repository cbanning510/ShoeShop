//
//  ViewController.swift
//  ShoeShock2
//
//  Created by chris on 10/30/20.
//

import UIKit

class ShoesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var shoesCollectionView: UICollectionView!
    
    private(set) public var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        products = DataService.instance.getShoes()
        shoesCollectionView.delegate = self
        shoesCollectionView.dataSource = self
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


}

