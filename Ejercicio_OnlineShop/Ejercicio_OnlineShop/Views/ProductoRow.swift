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

