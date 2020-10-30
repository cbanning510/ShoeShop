//
//  DetailsViewController.swift
//  ShoeShock2
//
//  Created by chris on 10/30/20.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var shoeImage: UIImageView!
    
    var imageUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageUrl = imageUrl {
            print(imageUrl)
            shoeImage.image = UIImage(named: imageUrl)
        }
    }

}

