//
//  Opciones.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 4/3/24.
//

import Foundation
import FirebaseFirestore

class Opciones: ObservableObject {
    @Published var seleccion : [Producto]
    @Published var elproducto : Producto
    @Published var seleccionado : Bool
    
    init() {
        self.seleccion = [Producto]()
        self.elproducto = Producto(id: 1, title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 109.95, description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 3.9))
        self.seleccionado = false
    }
}
