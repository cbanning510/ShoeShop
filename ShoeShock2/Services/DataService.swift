//
//  DataService.swift
//  ShoeShock
//
//  Created by chris on 10/29/20.
//  Copyright © 2020 chrisbanning. All rights reserved.
//


import Foundation

class DataService {
    static let instance = DataService()
    
    let shoes = [
        Product(title: "Space Hippie 04", price: "$140", imageName: "space-hippie-4"),
        Product(title: "Jordan React Elevation", price: "$130", imageName: "jordan-react-elevation"),
        Product(title: "Hoodland Men's Boot", price: "$180", imageName: "hoodland-mens-boot"),
        Product(title: "Blazer Mid 77 Vintage", price: "$135", imageName: "blazer-mid-77-vintage"),
        Product(title: "Air Tailwind 79", price: "$145", imageName: "air-tailwind-79"),
        Product(title: "Air Max 90", price: "$195", imageName: "air-max-90")
    ]
    
    
    func getShoes() -> [Product] {
        return shoes
    }
    
}

