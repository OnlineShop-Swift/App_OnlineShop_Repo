//
//  FooterView.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 4/3/24.
//

import SwiftUI

struct FooterView: View {
    @EnvironmentObject var opciones: Opciones
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        TabView {
            ProductoListView(list: ProductosViewModel())
                .environmentObject(opciones)                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }
            OrderView()
                .environmentObject(opciones)
                .badge(opciones.seleccion.count)
                .tabItem {
                    Label("Order", systemImage: "cart.fill")
                }
                
                
            
        }
        //.accentColor(colorScheme == .dark ? Color.green: Color.coloPrim)
        .accentColor(Color.coloPrueba)

    }

}

#Preview {
    FooterView()
}
