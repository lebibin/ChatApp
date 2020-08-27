//
//  AuthenticationView.swift
//  ChatApp
//
//  Created by Kevin Candelaria on 25/08/2020.
//  Copyright © 2020 Kevin Candelaria. All rights reserved.
//

import SwiftUI

struct AuthenticationView: View {
    @Binding var authentication: Authentication
    @Binding var authenticated: Bool?
    @Binding var credentials: [Credential]
    @Binding var username: String
    @Binding var password: String
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Spacer().frame(maxHeight: 32)
                TextField("User name", text: $username)
                    .frame(height: 56)
                    .padding([.leading, .trailing], 12)
                    .background(Color.init(red: 241/255, green: 247/255, blue: 250/255))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 4))
                    .padding([.leading, .trailing], 12)
                if self.authenticated == false { ErrorMessage() }
                SecureField("password", text: $password)
                    .frame(height: 56)
                    .padding([.leading, .trailing], 12)
                    .background(Color.init(red: 241/255, green: 247/255, blue: 250/255))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 4))
                    .padding([.leading, .trailing], 12)
                if self.authenticated == false { ErrorMessage() }
                Button(action: {
                    if self.authentication == .login {
                        self.handleAuthentication()
                    } else {
                        self.handleSignUp()
                    }
                 }) {
                    Text(self.authentication.title)
                         .kerning(2.0)
                         .fontWeight(.bold)
                         .padding()
                         .frame(maxWidth: .infinity)
                         .background(Color.init(red: 129/255, green: 222/255, blue: 45/255))
                         .foregroundColor(.white)
                         .cornerRadius(8.0)
                         .font(.system(size: 24.0))
                         .padding()
                 }
                Button(action: {
                    self.authenticated = nil
                    self.authentication = self.CounterpartAuthentication()
                }) {
                    Text(CounterpartAuthentication().title)
                        .underline()
                        .kerning(2.0)
                        .fontWeight(.medium)
                        .font(.system(size: 18.0))
                        .foregroundColor(Color.init(red: 88/255, green: 108/255, blue: 125/255))
                }
                Text("By signing up, you agree to the Terms of Service and Privacy Policy, including Cookie Use. Others will be able to find you by searching for your email address or phone number when provided.")
                    .kerning(1.0)
                    .fontWeight(.medium)
                    .foregroundColor(Color.init(red: 88/255, green: 108/255, blue: 125/255))
                    .padding([.leading, .trailing], 16)
                    .padding(.top, 16.0)

                Spacer()
            }.navigationBarTitle("Chat app", displayMode: .inline)
        }
    }
    
    private func handleSignUp() {
        self.authenticated = false
        if(!self.validateCredentials()) { return }
        self.authenticated = true
        self.credentials.append(
            Credential(username: self.username,
                       password: self.password
            )
        )
        self.clearForm()
    }
    
    private func validateCredentials() -> Bool {
        let validCount = (8...16)
        return validCount.contains(self.username.count) && validCount.contains(self.password.count)
    }
    
    private func handleAuthentication() {
        self.authenticated = false
        if !(self.validateCredentials() ) { return }
        for credential in self.credentials {
            if(credential.username == self.username) {
                self.authenticated = credential.password == self.password
                self.clearForm()
                break
            }
        }
    }
    
    private func clearForm() {
        self.authentication = .signup
        self.username = ""
        self.password = ""
    }
    
    private func CounterpartAuthentication() -> Authentication {
        switch self.authentication {
        case .login: return .signup
        case .signup: return .login
        }
    }
    
    private func ErrorMessage() -> AnyView {
        return AnyView(
            Text("Value is incorrect")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(red: 190/255, green: 48/255, blue: 49/255))
                .padding([.leading, .trailing], 16)
        )
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(authentication: .constant(.login),
                  authenticated: .constant(nil),
                  credentials: .constant([]),
                  username: .constant(""),
                  password: .constant(""))
    }
}
