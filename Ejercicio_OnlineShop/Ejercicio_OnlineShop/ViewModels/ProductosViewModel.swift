//
//  ProductosViewModel.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 5/2/24.
//

import Foundation
import FirebaseFirestore

class ProductosViewModel: ObservableObject {
    @Published var productos: [Producto]
    @Published var carro = [Producto]()
    private var db = Firestore.firestore()
    init() {
        self.productos = [Producto]()
        getProductos()
    }
    
    func getProductos(){
            Task{ //hace que sea asíncrona la tarea, consiguiendo concurrencia
                do{
                    let productos = try await NetworkManager.shared.getProductos()
                    self.productos = productos
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
    
    func all() {
        db.collection("orders").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("ERROR: No hay productos")
                return
            }

            self.carro = documents.map { (queryDocumentSnapshot) -> Producto in
                let data = queryDocumentSnapshot.data()
                let id = data["id"] as? Int ?? 0
                let title = data["title"] as? String ?? ""
                let price = data["price"] as? Double ?? 0.0
                let description = data["description"] as? String ?? ""
                let image = data["image"] as? String ?? ""
                let rating = data["rating"] as? Double ?? 0.0
                return Producto(id: id, title: title, price: price, description: description, image: image, rating: Rating(rate: rating))
            }
        }
    }

    func add(opciones: Opciones) {
            var order = Order(productos: opciones.seleccion)
            do{
                try db.collection("orders").addDocument(from: order)
                opciones.seleccion = []
            }catch{
                print(error)
            }
        }
}
