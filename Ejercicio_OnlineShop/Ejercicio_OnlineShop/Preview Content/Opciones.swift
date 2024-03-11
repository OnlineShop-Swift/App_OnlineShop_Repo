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
    
    init() {
        self.seleccion = [Producto]()
    }
}
