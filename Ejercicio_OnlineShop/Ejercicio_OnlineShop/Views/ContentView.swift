//
//  ContentView.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 5/2/24.
//

import SwiftUI

//Mi cambio
struct ContentView: View {
    @ObservedObject var productos = ProductosViewModel()
    @ObservedObject var opciones: Opciones = Opciones()
    var body: some View {
        FooterView()
            .environmentObject(opciones)
        
        //ProductoListView(list: productos)
            //.environmentObject(opciones)
        
    }
}



struct ContentView_Previews: PreviewProvider {
    //static let opciones = Opciones()

    static var previews: some View {
        ContentView()
            //.environmentObject(opciones)
    }
}
