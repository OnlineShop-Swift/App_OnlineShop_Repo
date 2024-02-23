//
//  Detail_View.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 23/2/24.
//

import SwiftUI

struct Detail_View: View {
    var producto: Producto

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: producto.image)){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)
            .padding(.bottom)
            Text(producto.title)
                .font(.title)
                .padding(.vertical)
                .fontWeight(.bold)
            Text(producto.description)
                .font(.title)
                .padding(.vertical)
                .fontWeight(.bold)
            
           
            
        }
        
        
        
    }
}
struct BotonAddCart : View {
    
    var body: some View {
        Button("Change day time", action: addCart)
            .padding()
            .padding(.horizontal)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10.0)
            .fontWeight(.bold)
        Spacer()
    }
    
    func addCart() {
        print("bh")
            
    }
    
}



#Preview {
    Detail_View(producto: Producto(id: 1, title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 109.95, description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", image: "https://fakestoreapi.com…PKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 3.9)))
}
