//
//  Producto.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 5/2/24.
//

import Foundation

struct Productos: Hashable, Codable, Identifiable{
    let id = UUID().uuidString
    var producto : [Producto]
}

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

