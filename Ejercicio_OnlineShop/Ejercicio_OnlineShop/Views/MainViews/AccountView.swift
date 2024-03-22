//
//  AccountView.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 4/3/24.
//

import SwiftUI

struct AccountView: View {
    @ObservedObject var list: ProductosViewModel
    @EnvironmentObject var opciones: Opciones
    @State var producto: Producto

    /*
    @State var nombre: String = ""
    //@AppStorage("apellido") var apellido: String = ""
    //@AppStorage("email") var email: String = ""
    //@AppStorage("birthday") var birthday: String = ""
    //@AppStorage("vip") var vip: Bool = false
    //@AppStorage("ofertas") var ofertas: Bool = false
    
    init() {
        let dato = UserDefaults.standard.string(forKey: "nombre")
        _nombre = State(wrappedValue: dato ?? "")
    }
     */
    var body: some View {
        
        ZStack{
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
                .blur(radius: 3.5)
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
                    .lineLimit(3)
                RatingView(rating: Decimal(producto.rating.rate))
                    .padding(.bottom)
                BotonAddCart(producto: $producto)
                    .environmentObject(opciones)
            
                
            }
            .padding()
            .background(.white)
            .border(.blue)
            
            
        }
        
        /*
        VStack{
            Text("Account")
                .bold()
                .font(.title)
                .padding()
            Form{
                Section(header: Text("PERSONAL INFO")) {
                    TextField("First name", text: $nombre)
                                
                    //TextField("Last name", text: $apellido)
                                
                    //TextField("Email", text: $email)
                    
                    Button("Save changes", action: guardarCambios)
                }
                Section(header: Text("SETTINGS")) {
                    
                }
                .onAppear{
                    nombre = UserDefaults.standard.string(forKey: "nombre") ?? ""
                }
            }
         */
        }
         
        
    }
     /*
    func guardarCambios(){
        UserDefaults.standard.set(nombre, forKey: "nombre")
        //self.presentationMode.wrappedValue.dismiss()
        
    }
      */
     

