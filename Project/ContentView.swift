//
//  ContentView.swift
//  Project
//
//  Created by Vanshita on 02/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var showingSignUpScreen = false
    
    var body: some View {
        NavigationView{
            ZStack {
                Color
                    .blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.9)
                    .foregroundColor(.white.opacity(0.35))
                Circle()
                    .scale(1.61)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Welcome!")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                    
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, 30)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Login") {
                        autheticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("You are logged in \(username)"), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                    
                    HStack{
                        Text("Don't have an account ?")
                            .font(.headline)
                            .padding(.top, 50)
                        
                        Button("Sign Up") {
                            showingSignUpScreen = true
                        }
                        .font(.headline)
                        .bold()
                        .padding(.top, 50)
                        
                        NavigationLink(destination: SignUpView(), isActive: $showingSignUpScreen){
                            EmptyView()
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    func autheticateUser(username: String, password: String) {
        if username.lowercased() == "vanshita2002" {
            wrongUsername = 0
            if password.lowercased() == "abc123" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

#Preview {
    ContentView()
}
