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
    var body: some View {
        Text("")
    }
}

#Preview {
    ContentView()
}
