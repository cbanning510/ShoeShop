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
    static let cart = Cart()
    
    class Cart {
        var products = [SelectedProduct]()
        func addProduct(product: Product) {
            let selectedProduct = SelectedProduct(product: product, quantity: 1)
            products.append(selectedProduct)
        }
        
        func getProducts() -> [SelectedProduct] {
            return products
        }
    }
    
    struct SelectedProduct {
        var product: Product
        var quantity = 0
    }
    
    
    func updateCart(product: Product, quantity: Int) {
        // find Product in cart
        // change quantity
    }
    
    let shoes = [
        Product(title: "Space Hippie 04", price: "$140", imageName: "space-hippie-4", description: "Space Hippie is a story of trash transformed. From the upper to the outsole, Space Hippie 04 is made of at least 25% recycled material by weight. Not only is it the most lightweight silhouette within the collection, it also has the lowest carbon footprint."),
        Product(title: "Jordan React Elevation", price: "$130", imageName: "jordan-react-elevation", description: "The Jordan React Elevation is inspired by team players who beat opponents with their grit and tenacity at both ends of the court. "),
        Product(title: "Hoodland Men's Boot", price: "$180", imageName: "hoodland-mens-boot", description: "Bringing outdoors inspiration to b-ball style, the Nike Hoodland blends a casual, cold-weather look with hiking boot details. Its durable suede upper is treated with a water-repellent finish while the metal eyelets at the top have an antique look."),
        Product(title: "Blazer Mid 77 Vintage", price: "$135", imageName: "blazer-mid-77-vintage", description: "The Nike Blazer Mid '77 Vintage harnesses the old-school look of Nike basketball with a vintage midsole finish, making it look like you've been saving them for years."),
        Product(title: "Air Tailwind 79", price: "$145", imageName: "air-tailwind-79", description: "Making its debut in 1978 for the Honolulu Marathon, the Nike Air Tailwind was a revolution in cushioning. Now, a racing icon returns with the Nike Air Tailwind 79, featuring nearly original materials and colors, plus the Nike Air unit that made it a winner."),
        Product(title: "Air Max 90", price: "$195", imageName: "air-max-90", description: "Nothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle outsole, stitched overlays and classic, color-accented TPU plates. Accents of retro color celebrate the first generation while Max Air cushioning adds comfort to your journey.")
    ]
    
    
    func getShoes() -> [Product] {
        return shoes
    }
    
}

