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
    @State private var currentUser: Credential?
    @State private var credentials: [Credential] = [
        Credential(username: "kevin123",
                   password: "letmein221b")
    ]
    @State private var messages: [Message] = [
        Message(content: "Hi Kevin, I just sent the document to you on mail. Plz check it!", senderName: "May", createdAt: Date()),
        Message(content: "Hi guys, what's up?", senderName: "Mark", createdAt: Date()),
        Message(content: "Hi Mark, I stay Cebu now", senderName: "April", createdAt: Date()),
    ]
    @State private var onboarded = false
    @State private var username = ""
    @State private var password = ""
    @ViewBuilder
    var body: some View {
        if !onboarded {
            IndexView(authentication: $authentication, onboarded: $onboarded)
        } else {
            if currentUser != nil {
                ChatView(currentUser: $currentUser, messages: $messages)
            } else {
                AuthenticationView(authentication: $authentication,
                                   currentUser: $currentUser,
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
