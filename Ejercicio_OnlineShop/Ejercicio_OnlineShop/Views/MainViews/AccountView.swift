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
    @State var birthday: Date = Date.now
    @State var vip: Bool = false
    @State var ofertas: Bool = false
    /*
    init() {
        self.nombre = UserDefaults.standard.string(forKey: "nombre") ?? ""
        self.apellido = UserDefaults.standard.string(forKey: "apellido") ?? ""
        self.email = UserDefaults.standard.string(forKey: "email") ?? ""
        //self.birthday = UserDefaults.standard.string(forKey: "nombre") ?? ""
        self.vip = UserDefaults.standard.bool(forKey: "vip") 
        self.ofertas = UserDefaults.standard.bool(forKey: "ofertas") 
    }
     */
    
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
                    DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                        
                    
                }
                Section(header: Text("SETTINGS")) {
                    Toggle(isOn: $vip){
                        Text("VIP customer")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.coloPrueba))
                    Toggle(isOn: $ofertas){
                        Text("Want receive emails with offers")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.coloPrueba))
                    Button("Save changes", action: guardarCambios)
                    
                }
                .onAppear{
                    self.nombre = UserDefaults.standard.string(forKey: "nombre") ?? ""
                    self.apellido = UserDefaults.standard.string(forKey: "apellido") ?? ""
                    self.email = UserDefaults.standard.string(forKey: "email") ?? ""
                    self.birthday = fecha( texto: UserDefaults.standard.string(forKey: "birthday") ?? "01-01-2024")
                    self.vip = UserDefaults.standard.bool(forKey: "vip")
                    self.ofertas = UserDefaults.standard.bool(forKey: "ofertas")
                }
            }
            
        }
        
        
    }
    func fecha(texto: String) -> Date{
        
        let dateFormatter = DateFormatter()
        
        let fecha = dateFormatter.date(from: texto) ?? Date()
        print(dateFormatter.date(from: texto) as Any)
        print(fecha)
        
        return fecha
    }
    
    func guardarCambios(){
        UserDefaults.standard.set(nombre, forKey: "nombre")
        UserDefaults.standard.set(apellido, forKey: "apellido")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(birthday, forKey: "birthday")
        UserDefaults.standard.set(vip, forKey: "vip")
        UserDefaults.standard.set(ofertas, forKey: "ofertas")

        //self.presentationMode.wrappedValue.dismiss()
        
    }
}
    
     

