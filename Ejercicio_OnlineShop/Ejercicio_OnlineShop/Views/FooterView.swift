//
//  FooterView.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 4/3/24.
//

import SwiftUI

struct FooterView: View {
    
    var body: some View {
        TabView {
            ProductoListView(list: ProductosViewModel())
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            AccountView()
                
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }
            OrderView()
                //.badge(_ Count:int)
                .tabItem {
                    Label("Order", systemImage: "cart.fill")
                }
            
        }

    }

}

#Preview {
    FooterView()
}
