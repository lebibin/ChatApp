//
//  ChatView.swift
//  ChatApp
//
//  Created by Kevin Candelaria on 27/08/2020.
//  Copyright © 2020 Kevin Candelaria. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    @Binding var authenticated: Bool?
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Hello World!")
            }.navigationBarTitle("Chat app", displayMode: .inline)
                .navigationBarItems(trailing:
                    Button(action: {
                        self.authenticated = nil
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
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(authenticated: .constant(nil))
    }
}
