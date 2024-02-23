//
//  ProductoRow.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 23/2/24.
//

import SwiftUI

struct ProductoRow: View {
    var producto: Producto
    var body: some View {
        HStack {
            Text(producto.title)
            Text(String(producto.price))
            Spacer()
        }
    }
}
var lista = ProductosViewModel()
#Preview {
    Group{
        ProductoRow(producto: lista.productos[1])
    }
}
