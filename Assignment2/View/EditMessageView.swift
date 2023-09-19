//
//  EditMessageView.swift
//  Assignment2
//
//  Created by Sunjun Kwak on 18/9/2023.
//

import Foundation
import SwiftUI

struct EditMessageView: View {
    @Binding var message: String
    @Binding var isEditingMessage: Bool
    @State private var initialMessage: String
    @State private var characterLimitPerLine = 30
    //@State private var editedMessage = ""
    
    // Create an Undo Manager instance
    init(message: Binding<String>, isEditingMessage: Binding<Bool>) {
        self._message = message
        self._isEditingMessage = isEditingMessage
        self._initialMessage = State(initialValue: message.wrappedValue)
    }
    
    private var bindingText: Binding<String> {
        Binding(
            get: {
                self.message
            },
            set: {
                let lines = $0.split(separator: "\n")
                let limitedLines = lines.map { String($0.prefix(self.characterLimitPerLine)) }
                self.message = limitedLines.joined(separator: "\n")
            }
        )
    }
    
    var body: some View {
        VStack {
            ScrollView {
                TextEditor(text: bindingText)
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 100)
                    .scrollContentBackground(.hidden)
                    .multilineTextAlignment(.leading)
                    .padding()
                
            }
            
            HStack {
                Button(action: {
                    //editedMessage = UserDefaults.standard.string(forKey: "messageKey") ?? ""
                    isEditingMessage = false
                }) {
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 124, height: 32)
                            .cornerRadius(6)
                            .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 4)
                        Text("Cancel")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {
                        UserDefaults.standard.set(message, forKey: "messageKey")
                        isEditingMessage = false
                    }) {
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 124, height: 32)
                                .cornerRadius(6)
                                .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 4)
                            Text("Confirm")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                }
            }
            .offset(x: 10)
        }
    }
}

