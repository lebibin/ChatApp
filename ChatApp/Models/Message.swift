//
//  Message.swift
//  ChatApp
//
//  Created by Kevin Candelaria on 27/08/2020.
//  Copyright © 2020 Kevin Candelaria. All rights reserved.
//

import Foundation

struct Message: Hashable {
    var content: String
    var senderName: String
    var createdAt: Date
}
