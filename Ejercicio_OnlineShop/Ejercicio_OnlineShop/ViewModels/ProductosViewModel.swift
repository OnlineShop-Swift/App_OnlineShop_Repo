//
//  ProductosViewModel.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 5/2/24.
//

import Foundation

class ProductosViewModel: ObservableObject {
    @Published var productos: [Producto]
    
    func getProductos(url:String){
            Task{ //hace que sea asíncrona la tarea, consiguiendo concurrencia
                do{
                    let producto = try await NetworkManager.shared.getProductos()
                    self.productos.append(producto)
                }catch{
                    
                    if let callError = error as? WEError {
                        switch callError{
                        case .invalidURL:
                            print("Invalid URL")
                        case .invalidResponse:
                            print("Invalid response")
                        case .invalidData:
                            print("Invalid data")
                        case .unableToComplete:
                            print("Unable to complete")
                        }
                        
                    }else{
                        //Generic error
                        print("Invalid response")
                    }
                }
            }
        }
}
