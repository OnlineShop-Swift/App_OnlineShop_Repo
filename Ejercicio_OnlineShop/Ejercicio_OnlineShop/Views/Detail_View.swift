//
//  Detail_View.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 23/2/24.
//

import SwiftUI
import Foundation

struct Detail_View: View {
    @State var producto: Producto
    @EnvironmentObject var opciones: Opciones
    @Environment(\.colorScheme) var colorScheme
    //@State var captura : UIImage

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: producto.image)){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)
            .padding(.bottom)
            
            Text(producto.title)
                .font(.title)
                .padding(.vertical)
                .fontWeight(.bold)
            Text(producto.description)
                .font(.title)
                .padding(.vertical)
                .lineLimit(3)
            RatingView(rating: Decimal(producto.rating.rate))
                .padding(.bottom)
            BotonAddCart(producto: $producto)
                .environmentObject(opciones)
        
            
        }
    }
}
struct BotonAddCart : View {
    @ObservedObject private var vm = ProductosViewModel()
    @Binding var producto: Producto
    @EnvironmentObject var opciones: Opciones
    var body: some View {
        Button("$" + String(producto.price) + " - Checkout", action: addCart)
            .padding()
            .padding(.horizontal)
            .foregroundColor(.white)
            .background(Color.coloPrueba)
            .cornerRadius(10.0)
            .fontWeight(.bold)
        
    }
    
    func addCart() {
        opciones.seleccion.append(producto)
    }
    
}
