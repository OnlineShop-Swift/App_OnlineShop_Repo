//
//  Ejercicio_OnlineShopApp.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 5/2/24.
//

import SwiftUI
import Firebase

@main
struct Ejercicio_OnlineShopApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ProductoListView(list: ProductosViewModel())
        }
    }
}
