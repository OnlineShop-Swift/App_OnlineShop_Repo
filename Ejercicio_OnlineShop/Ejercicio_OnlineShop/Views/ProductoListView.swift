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
    //@EnvironmentObject var opciones: Opciones
    var body: some View {
        NavigationSplitView{
                List(list.productos){ current in
                    NavigationLink{
                        Detail_View(producto: current)
                    } label: {
                        ProductoRow(producto: current)
                    }
                }
                .navigationTitle("Products")
            
            }detail: {
                Text("Select Product")
            }
       
        
    }
}



#Preview {
    ProductoListView(list: ProductosViewModel())
}

