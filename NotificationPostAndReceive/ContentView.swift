//
//  ContentView.swift
//  NotificationPostAndReceive
//
//  Created by Emrè Barish on 03/05/2024.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var messageSent: String = ""
    @State private var messageReceived: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Your message", text: $messageSent)
                Button("Send Message") {
                    NotificationCenter.default.post(name: .messageDidSend, object: nil)
                }
            }
            
            Section {
                Text(messageReceived)
                    .onReceive(NotificationCenter.default.messageDidSendPublisher) {_ in
                        messageReceived = messageSent
                    }
            } header: {
                Text("Message Received")
            }
        }
    }
}

// MARK: - Notification names and publishers

extension Notification.Name {
    static let messageDidSend = Notification.Name("messageDidSend")
}

extension NotificationCenter {
    var messageDidSendPublisher: Publishers.ReceiveOn<
        NotificationCenter.Publisher, DispatchQueue
    > {
        return publisher(for: .messageDidSend).receive(on: DispatchQueue.main)
    }
}

// MARK: - Previews

#Preview {
    ContentView()
}
