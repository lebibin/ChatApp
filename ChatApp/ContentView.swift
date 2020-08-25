//
//  ContentView.swift
//  ChatApp
//
//  Created by Kevin Candelaria on 25/08/2020.
//  Copyright © 2020 Kevin Candelaria. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("logo")
            Text("Chat app")
            .fontWeight(.bold)
            .font(.system(size: 40.0))
            .kerning(4.0)
            .padding(.top, -52.0)
            Button(action: {
                print("Sign Up tapped!")
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
                print("Log in tapped!")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
