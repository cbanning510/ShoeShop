//
//  SelectedProduct.swift
//  ShoeShock2
//
//  Created by chris on 10/30/20.
//

import Foundation

struct SelectedProduct: Equatable {
    static func == (lhs: SelectedProduct, rhs: SelectedProduct) -> Bool {
        if lhs.product?.title == rhs.product?.title {
            return true
        } else {
            return false
        }
    }
    
    var product: Product?
    var quantity = 0
}
