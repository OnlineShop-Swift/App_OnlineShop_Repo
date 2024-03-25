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
        HStack{
            
            VStack {
                AsyncImage(url: URL(string: producto.image)){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 170, height: 200)
                .padding(.bottom)
                
                Text(producto.title)
                    .font(.title3)
                    .padding(.vertical)
                    .fontWeight(.bold)
                Text(producto.description)
                    .padding(.vertical)
                    .lineLimit(3)
                RatingView(rating: Decimal(producto.rating.rate))
                    .padding(.bottom)
                BotonAddCart(producto: $producto)
                    .environmentObject(opciones)
            }
            .padding([.top, .bottom, .leading], 20)
            VStack{
                BotonCerrar()
                    .padding(.top,5)
                Spacer()
                
                
            }
        }
        .background(Color.white)
    }
    
}

struct BotonCerrar : View {
    @EnvironmentObject var opciones: Opciones
    
    var body: some View {
        Button("", systemImage:"xmark", action: cerrar)
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding(.trailing, 5)
        
    }
    func cerrar() {
        opciones.seleccionado = false
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
