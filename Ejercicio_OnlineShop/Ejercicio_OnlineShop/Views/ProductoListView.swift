//
//  ProductoListView.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 23/2/24.
//

import SwiftUI

struct ProductoListView: View {
    @ObservedObject var productos: ProductosViewModel
    var body: some View {
        ForEach(productos.productos) { produc in
            Text(produc.title)
            Text(String(produc.id))

                
        }
    
        //Text(String(productos.productos[0].price))
        Text(String(productos.productos.isEmpty))
    }
}



#Preview {
    ProductoListView(productos:  ProductosViewModel())
}
