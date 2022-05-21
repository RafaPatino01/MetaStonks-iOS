//
//  login.swift
//  MetaStonks
//
//  Created by Rafael Patino on 20/05/22.
//

import Foundation

import SwiftUI

struct LoginView: View {
    @State private var logged = false
    @State private var showAlert = false
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        if(logged == true){
            MainView()
        }
        else{
            NavigationView {
                ZStack {
                    Color(red: 0.1, green: 0.1, blue: 0.1)
                    .edgesIgnoringSafeArea(.all)
                    VStack (alignment: .center){
                        VStack {
                            Text("🚀")
                                .font(.system(size: 50))
                            .padding()
                            Text("Iniciar sesión")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, 63.0)
                        
                        
                        VStack (alignment: .leading){
                            ZStack(alignment: .leading){
                                if username.isEmpty{
                                    Text("Usuario")
                                        .foregroundColor(.white.opacity(0.3))
                                }
                                TextField("",text: $username)
                            }
                            .padding(.leading, 20.0)
                            .frame(width: nil, height: 50)
                            .border(Color.white, width: 2)
                            .cornerRadius(4)
                            .foregroundColor(.white)
                            
                            ZStack(alignment: .leading){
                                if password.isEmpty{
                                    Text("Contraseña")
                                        .foregroundColor(.white.opacity(0.3))
                                }
                                SecureField("",text: $password)
                            }
                            .padding(.leading, 20.0)
                            .frame(width: nil, height: 50)
                            .border(Color.white, width: 2)
                            .cornerRadius(4)
                            .foregroundColor(.white)
                        }
                        .padding(.horizontal, 45.0)
                        
                        VStack {
                            Button("Entrar") {

                                //Login with API
                                Api().login(pUser: username.lowercased(), pPass: password, completion: { (res) in
                                    if(res[0] == "OK"){
                                        print("Loggeado pa!")
                                        logged = true
                                    }
                                    else {
                                        showAlert = true
                                    }
                                })
                                
                            }
                            .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Contraseña incorrecta"),
                                    message: Text("Intenta nuevamente")
                                )
                            }
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            .frame(width: 250, height: 40)
                            .background(.blue)
                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.top, 25.0)
                        
                        VStack {
                            NavigationLink(destination: RegisterView()) {
                                Text("Registrarse")
                            }
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            .frame(width: 250, height: 40)
                            .background(.gray)
                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.top, 5.0)
                        
                        
                    }
                }
                .padding(.top, -100.0)
            }
            
        }
        
    }
}

struct RegisterView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.1, blue: 0.1)
            .edgesIgnoringSafeArea(.all)
            VStack (alignment: .center){
                VStack {
                    Text("🚀")
                        .font(.system(size: 50))
                    .padding()
                    Text("Registro")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 63.0)
                

                VStack (alignment: .leading){
                    ZStack(alignment: .leading){
                        if username.isEmpty{
                            Text("Usuario")
                                .foregroundColor(.white.opacity(0.3))
                        }
                        TextField("",text: $username)
                    }
                    .padding(.leading, 20.0)
                    .frame(width: nil, height: 50)
                    .border(Color.white, width: 2)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    
                    ZStack(alignment: .leading){
                        if email.isEmpty{
                            Text("Email")
                                .foregroundColor(.white.opacity(0.3))
                        }
                        TextField("",text: $email)
                    }
                    .padding(.leading, 20.0)
                    .frame(width: nil, height: 50)
                    .border(Color.white, width: 2)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    
                    ZStack(alignment: .leading){
                        if password.isEmpty{
                            Text("Contraseña")
                                .foregroundColor(.white.opacity(0.3))
                        }
                        SecureField("",text: $password)
                    }
                    .padding(.leading, 20.0)
                    .frame(width: nil, height: 50)
                    .border(Color.white, width: 2)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                }
                .padding(.horizontal, 45.0)
                
                
                VStack {
                    Button("Siguiente") {
                        //Register with API
                        Api().register(pUser: username.lowercased(), pPass: password, pEmail: email, completion: { (res) in
                            
                            if(res[0] == "OK"){
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        })
                        
                    }
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .frame(width: 250, height: 40)
                    .background(.blue)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                }
                .padding(.top, 25.0)
                
                VStack {
                    Button("< Regresar") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .frame(width: 250, height: 40)
                    .background(.gray)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .navigationBarHidden(true)
                }
                .padding(.top, 5.0)
                
                
            }
        }.padding(.top, -100.0)
    }
}
