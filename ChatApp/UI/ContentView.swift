//
//  ContentView.swift
//  ChatApp
//
//  Created by Kevin Candelaria on 25/08/2020.
//  Copyright © 2020 Kevin Candelaria. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var authentication: Authentication = .login
    @State private var authenticated: Bool? = nil
    @State private var credentials: [Credential] = [
        Credential(username: "kevin123",
                   password: "letmein221b")
    ]
    @State private var onboarded = false
    @State private var username = ""
    @State private var password = ""
    @ViewBuilder
    var body: some View {
        if !onboarded {
            IndexView(authentication: $authentication, onboarded: $onboarded)
        } else {
            if(authenticated ?? false) {
                ChatView(authenticated: $authenticated)
            } else {
                AuthenticationView(authentication: $authentication,
                                   authenticated: $authenticated,
                                   credentials: $credentials,
                                   username: $username,
                                   password: $password
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
