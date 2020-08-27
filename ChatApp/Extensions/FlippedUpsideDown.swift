//
//  FlippedUpsideDown.swift
//  ChatApp
//
//  Created by Kevin Candelaria on 27/08/2020.
//  Copyright © 2020 Kevin Candelaria. All rights reserved.
//

import Foundation
import SwiftUI

// https://medium.com/@michael.forrest.music/how-to-make-a-scrollview-or-list-in-swiftui-that-starts-from-the-bottom-b0c4a69beb0d

struct FlippedUpsideDown: ViewModifier {
    func body(content: Content) -> some View {
        content.rotationEffect(Angle(radians: Double.pi)).scaleEffect(x: -1, y: 1, anchor: .center)
    }
}
extension View {
    func flippedUpsideDown() -> some View {
        self.modifier(FlippedUpsideDown())
    }
}
