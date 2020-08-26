//
//  IndexView.swift
//  ChatApp
//
//  Created by Kevin Candelaria on 25/08/2020.
//  Copyright © 2020 Kevin Candelaria. All rights reserved.
//

import SwiftUI

struct IndexView: View {
    @Binding var authentication: Authentication
    @Binding var onboarded: Bool
    var body: some View {
        VStack(alignment: .center) {
            Image("logo")
            Text("Chat app")
            .fontWeight(.bold)
            .font(.system(size: 40.0))
            .kerning(4.0)
            .padding(.top, -52.0)
            Button(action: {
                self.authentication = .signup
                self.onboarded = true
            }) {
                    Text("Sign up")
                    .kerning(2.0)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.init(red: 88/255, green: 152/255, blue: 31/255))
                    .foregroundColor(.white)
                    .cornerRadius(8.0)
                    .font(.system(size: 24.0))
                    .padding()
            }.padding(.top, 24.0)
            Button(action: {
                self.authentication = .login
                self.onboarded = true
            }) {
                    Text("Login")
                    .kerning(2.0)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.init(red: 129/255, green: 222/255, blue: 45/255))
                    .foregroundColor(.white)
                    .cornerRadius(8.0)
                    .font(.system(size: 24.0))
                    .padding()
            }.padding(.top, -16.0)
        }
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView(authentication: .constant(.login), onboarded: .constant(false))
    }
}
