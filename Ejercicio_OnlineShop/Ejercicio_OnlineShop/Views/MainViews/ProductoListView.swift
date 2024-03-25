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
    @State var seleccionado: Bool = false
    //@State var borrosidad: Double = 0.0
    //@State var opacidad: Double = 0.0
    var body: some View {
        ZStack{
            NavigationSplitView{
                List(list.productos){ current in
                        
                    ProductoRow(producto: current).onTapGesture {
                        Detail_View(producto: current)
                            .environmentObject(opciones)
                        opciones.seleccionado = true
                        opciones.elproducto = current
                    }
                }.navigationTitle("Products")
                    
                
            }detail: {
                Text("Select Product")
            }
            .blur(radius: opciones.seleccionado ? 10.0 : 0.0)
            if (opciones.seleccionado){
                Detail_View(producto: opciones.elproducto)
                    .environmentObject(opciones)
                    .frame(maxWidth: 300, maxHeight: 550)
                    .cornerRadius(20)
            }
            
            
                
        }
        
    }
}



