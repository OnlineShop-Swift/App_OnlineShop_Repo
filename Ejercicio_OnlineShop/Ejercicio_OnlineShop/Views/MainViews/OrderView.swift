//
//  OrderView.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 11/3/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var opciones: Opciones
    
    var body: some View {
        VStack{
            NavigationSplitView{
                List(opciones.seleccion){ current in
                            ProductoRow(producto: current)
                    }
                    .navigationTitle("Shopping Cart")
                
                }detail: {
                }
            Spacer()
           
            BotonAddOrder()
                .environmentObject(opciones)
        }
        
    }
    
}

struct BotonAddOrder : View {
    @ObservedObject private var vm = ProductosViewModel()
    @EnvironmentObject var opciones: Opciones
    var body: some View {
        Button("$" + precioTotal() + " - Checkout", action: addOrder)
            .padding()
            .padding(.horizontal)
            .foregroundColor(.white)
            .background(Color.coloPrim)
            .cornerRadius(10.0)
            .fontWeight(.bold)
        
    }
    
    func addOrder() {
        
            vm.add(opciones: opciones)

        
    }
    func precioTotal() -> String{
        var total = 0.0
        for elemento in opciones.seleccion {
            total += elemento.price
        }
        return String(total)
    }
    
}


