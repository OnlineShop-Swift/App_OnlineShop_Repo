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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ProductoListView(productos: ProductosViewModel())
}
