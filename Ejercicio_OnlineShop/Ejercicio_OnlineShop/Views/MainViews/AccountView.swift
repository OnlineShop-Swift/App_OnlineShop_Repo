//
//  AccountView.swift
//  Ejercicio_OnlineShop
//
//  Created by  on 4/3/24.
//

import SwiftUI

struct AccountView: View {
    
    @State var nombre: String = ""
    @State var apellido: String = ""
    @State var email: String = ""
    @State var birthday: String = ""
    @State var vip: Bool = false
    @State var ofertas: Bool = false
    
    init() {
        self.nombre = UserDefaults.standard.string(forKey: "nombre") ?? ""
    }
     
    
    var body: some View {
        
        
        VStack{
            Text("Account")
                .bold()
                .font(.title)
                .padding()
                
            Form{
                Section(header: Text("PERSONAL INFO")) {
                    TextField("First name", text: $nombre)
                    
                    TextField("Last name", text: $apellido)
                    
                    TextField("Email", text: $email)
                    
                    Button("Save changes", action: guardarCambios)
                }
                Section(header: Text("SETTINGS")) {
                    Button("Save changes", action: guardarCambios)
                    
                }/*
                .onAppear{
                    nombre = UserDefaults.standard.string(forKey: "nombre") ?? ""
                }*/
            }
            
        }
        
        
    }
    
    func guardarCambios(){
        UserDefaults.standard.set(nombre, forKey: "nombre")
        //self.presentationMode.wrappedValue.dismiss()
        
    }
}
    
     

