//
//  ChatRow.swift
//  ChatApp
//
//  Created by Kevin Candelaria on 27/08/2020.
//  Copyright © 2020 Kevin Candelaria. All rights reserved.
//

import SwiftUI

// // https://github.com/halavins/SwiftUI-Chat/blob/master/SwiftUI%20Chat/ContentView.swift
struct ChatRow: View {
    var message: Message
    var reader: String
    var isMe: Bool {
        return message.senderName == reader
    }
    var body: some View {
        Group {
            if !isMe {
                VStack {
                    HStack {
                        Group {
                            chatBubbleTriange(width: 8, height: 14, isIncoming: !isMe)
                            Text(message.content)
                            .bold()
                            .padding(8)
                            .foregroundColor(Color.white)
                            .background(Color.init(red: 129/255, green: 222/255, blue: 45/255))
                            .cornerRadius(8)
                                .padding([.leading], -1.0)
                            Spacer()
                        }
                    }
                    HStack {
                        Text(message.senderName)
                            .foregroundColor(Color.init(red: 90/255, green: 91/255, blue: 92/255))
                            .padding([.top], -4.0)
                        Spacer()
                    }
                }
            } else {
                VStack {
                    HStack {
                        Group {
                            Spacer()
                            Text(message.content)
                                .bold()
                                .padding(8)
                                .foregroundColor(Color.white)
                                .background(Color.init(red: 129/255, green: 222/255, blue: 45/255))
                                .cornerRadius(8)
                            .cornerRadius(8)
                            chatBubbleTriange(width: 8, height: 14, isIncoming: !isMe)
                        }
                        
                    }
                    HStack {
                        Group {
                            Spacer()
                            Text(message.senderName)
                                .foregroundColor(Color.init(red: 90/255, green: 91/255, blue: 92/255))
                                .padding([.top], -4.0)
                        }
                    }
                }
            }
        }

    }
    
    // https://github.com/cometchat-pro-tutorials/swift-ui-chat/blob/master/CometChat/CometChat/Views/Chat/ChatMessageRow.swift
    private func chatBubbleTriange(width: CGFloat, height: CGFloat, isIncoming: Bool) -> some View {
      Path { path in
        path.move(to: CGPoint(x: isIncoming ? 0 : width, y: height * 0.5))
        path.addLine(to: CGPoint(x: isIncoming ? width : 0, y: height))
        path.addLine(to: CGPoint(x: isIncoming ? width : 0, y: 0))
        path.closeSubpath()
      }
      .fill(Color.init(red: 129/255, green: 222/255, blue: 45/255))
      .frame(width: width, height: height)
      .zIndex(10)
      .clipped()
      .padding(.leading, !isIncoming ? -8 : -1)
      .padding(.trailing, !isIncoming ? -1 : -16)
      .padding(.bottom, -5.0)
    }
}
