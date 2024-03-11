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
            AsyncImage(url: URL(string:producto.image)){
                image in image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width:75, height:90)
            .padding()
            VStack{
                HStack{
                    Text(producto.title).bold()
                    Spacer()
                }
                HStack{
                    Text("$" + String(producto.price))
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                
            }
        }
    }
}
var lista = ProductosViewModel()

#Preview {
    ProductoRow(producto: Producto(id: 1, title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 109.95, description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 3.9)))
}


