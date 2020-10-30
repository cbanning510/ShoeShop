//
//  Product.swift
//  ShoeShock
//
//  Created by chris on 10/29/20.
//  Copyright © 2020 chrisbanning. All rights reserved.
//

import Foundation

struct Product {
    private(set) public var title: String
    private(set) public var price: String
    private(set) public var imageName: String
    
    init(title: String, price: String, imageName: String) {
        self.title = title
        self.price = price
        self.imageName = imageName
    }
}
