//
//  ProductoListView.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 23/2/24.
//

import SwiftUI

struct ProductoListView: View {
    @ObservedObject var list: ProductosViewModel
    var body: some View {
        NavigationSplitView{
                List(list.productos){ current in
                    NavigationLink{
                        
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
    ContentView()
}
