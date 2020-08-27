//
//  ChatView.swift
//  ChatApp
//
//  Created by Kevin Candelaria on 27/08/2020.
//  Copyright © 2020 Kevin Candelaria. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    @Binding var currentUser: Credential?
    @Binding var messages: [Message]
    @State private var message = ""
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                List {
                    ForEach(self.messages.reversed(), id: \.self) { message in
                        ChatRow(message: message, reader: self.currentUser?.username ?? "").flippedUpsideDown()
                    }
                }
                .flippedUpsideDown()
                HStack {
                    TextField("Start a new message", text: $message)
                        .frame(height: 56)
                        .padding([.leading, .trailing], 12)
                        .background(Color.init(red: 241/255, green: 247/255, blue: 250/255))
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 4))
                        .padding([.leading], 8.0)
                    Button(action: {
                        self.sendMessage()
                    }) {
                        Text("send")
                        .kerning(1.0)
                        .padding(14.0)
                        .background(Color.init(red: 90/255, green: 91/255, blue: 92/255))
                        .foregroundColor(.white)
                        .cornerRadius(4.0)
                    }.padding(.trailing, 8.0)
                }
            }.navigationBarTitle("Chat app", displayMode: .inline)
                .navigationBarItems(trailing:
                    Button(action: {
                        self.currentUser = nil
                    }) {
                    Text("Log out")
                    .kerning(1.0)
                    .padding(7.0)
                    .background(Color.init(red: 90/255, green: 91/255, blue: 92/255))
                    .font(.system(size: 13.0))
                    .foregroundColor(.white)
                    .cornerRadius(4.0)
                }
            )
        }
    }
    
    private func sendMessage() {
        if self.message.isEmpty { return }
        self.messages.append(Message(content: self.message,
                                     senderName: self.currentUser?.username ?? "Kim Dahyun",
                                     createdAt: Date()))
        self.message = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(currentUser: .constant(nil),
                 messages: .constant([]))
    }
}
