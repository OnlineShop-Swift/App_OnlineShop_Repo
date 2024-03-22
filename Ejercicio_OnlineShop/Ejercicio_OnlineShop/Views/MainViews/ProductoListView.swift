//
//  ProductoListView.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 23/2/24.
//

import SwiftUI
import Foundation

struct ProductoListView: View {
    @ObservedObject var list: ProductosViewModel
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var opciones: Opciones
    var body: some View {
        ZStack{
            NavigationSplitView{
                    List(list.productos){ current in
                        NavigationLink{
                            Detail_View(producto: current)
                                .environmentObject(opciones)
                            
                        } label: {
                            ProductoRow(producto: current)
                        }
                    }
                    .navigationTitle("Products")
                
            }detail: {
                Text("Select Product")
            }
            .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            Text("Hola")
                .background(Color.white)
                
        }
        
    }
}



#Preview {
    ProductoListView(list: ProductosViewModel())
}

