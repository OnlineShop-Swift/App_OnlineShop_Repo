//
//  Ejercicio_OnlineShopApp.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 5/2/24.
//

import SwiftUI

@main
struct Ejercicio_OnlineShopApp: App {
    var body: some Scene {
        WindowGroup {
            ProductoListView(list: ProductosViewModel())
        }
    }

}
