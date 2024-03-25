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
    @State private var showAlert = false
    @State private var mensaje = "Your profile was succesfully saved"

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
                        .alert(isPresented: $showAlert){
                            Alert(
                                title: Text("Profile saved"),
                                message: Text(mensaje)
                            )
                        }
                    
                }
                .onAppear{
                    self.nombre = UserDefaults.standard.string(forKey: "nombre") ?? ""
                    self.apellido = UserDefaults.standard.string(forKey: "apellido") ?? ""
                    self.email = UserDefaults.standard.string(forKey: "email") ?? ""
                    //self.birthday = fecha( texto: UserDefaults.standard.string(forKey: "birthday") ?? "01-01-2024")
                    self.birthday = fecha( texto: UserDefaults.standard.string(forKey: "birthday") ?? "01-01-2024")
                    self.vip = UserDefaults.standard.bool(forKey: "vip")
                    self.ofertas = UserDefaults.standard.bool(forKey: "ofertas")
                }
            }
            
        }
        
        
    }
    func fecha(texto: String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let fecha = dateFormatter.date(from: texto) ?? Date()
        return fecha
    }
    
    func guardarCambios(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"

        UserDefaults.standard.set(nombre, forKey: "nombre")
        UserDefaults.standard.set(apellido, forKey: "apellido")
        UserDefaults.standard.set(email, forKey: "email")
        if(Date.now > birthday){
            UserDefaults.standard.set(dateFormatter.string(from: birthday), forKey: "birthday")
            mensaje = "Your profile was succesfully saved"
        } else {
            print("No guardamos la fecha")
            mensaje = "Your profile was succesfully saved, except the birthday."
        }
        UserDefaults.standard.set(vip, forKey: "vip")
        UserDefaults.standard.set(ofertas, forKey: "ofertas")
        showAlert = true
        //self.presentationMode.wrappedValue.dismiss()
        
    }
}
    
     

