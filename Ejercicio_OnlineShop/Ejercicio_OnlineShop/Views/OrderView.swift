//
//  OrderView.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 4/3/24.
//

import SwiftUI
import Foundation

struct OrderView: View {
    @ObservedObject var list: ProductosViewModel
    //@EnvironmentObject var opciones: Opciones
    var body: some View {
        NavigationSplitView{
                List(list.carro){ current in
                        ProductoRow(producto: current)
                }
                .navigationTitle("Shopping cart")
            
            }detail: {
                Text("Your Selected Product")
            }
       
        
    }
}



#Preview {
    OrderView(list: ProductosViewModel())
}
