//
//  Authentication.swift
//  ChatApp
//
//  Created by Kevin Candelaria on 26/08/2020.
//  Copyright © 2020 Kevin Candelaria. All rights reserved.
//

import Foundation

enum Authentication {
    case login
    case signup
}

extension Authentication {
    var title: String {
        switch(self) {
        case .login: return "Login"
        case .signup: return "Sign up"
        }
    }
}
