//
//  Producto.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 5/2/24.
//

import Foundation
import FirebaseFirestore

struct Producto: Hashable, Codable, Identifiable{
    var id : Int
    var title : String
    var price: Double
    var description : String
    var image : String
    var rating: Rating
}

struct Rating: Hashable, Codable{
    var rate : Double
}

struct Mock{
    static let producto = Producto(id: 1, title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 109.95, description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 3.9))
}

struct Order:Codable{
    @DocumentID var id:String?
    var productos : [Producto]
}
