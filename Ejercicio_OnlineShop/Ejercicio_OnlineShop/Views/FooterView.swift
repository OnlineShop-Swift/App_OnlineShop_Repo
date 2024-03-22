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
            AccountView(list: ProductosViewModel(), producto: Producto(id: 1, title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 109.95, description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 3.9)))
                
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
