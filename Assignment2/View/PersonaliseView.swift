//
//  PersonaliseView.swift
//  Assignment2
//
//  Created by Sunjun Kwak on 16/9/2023.
//

import Foundation
import SwiftUI

struct PersonaliseView: View {
    @State private var message: String = "Edit your message here"
    @State private var isEditingMessage = false // To control the popup visibility
    @State private var editedMessage = "" // To store the edited message
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Personalise your texts")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(.black)
                            
                Text("Text for Group")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                }
            
            ZStack(alignment: .center) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 236)
                    .background(Color(red: 0.84, green: 0.97, blue: 0.85))
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                
                Text(message)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                    .padding()
                
                // Button to open the edit popup
                Button(action: {
                    self.isEditingMessage = true // Show the popup
                    editedMessage = message // Initialize edited message with the current message
                }) {
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 260, height: 32)
                            .cornerRadius(6)
                            .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 4)
                        Text("Edit Message")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                    }
                }
                
                // Edit message popup
                .popover(isPresented: $isEditingMessage) {
                    EditMessageView(message: $editedMessage, isEditingMessage: $isEditingMessage)
                        .onChange(of: editedMessage) { newValue in
                        // Update the message when the editedMessage changes
                        message = newValue
                        UserDefaults.standard.set(message, forKey: "messageKey")
                    }
                        .frame(width: 330, height: 236)
                        .background(Color(red: 0.84, green: 0.97, blue: 0.85))
                }
                .offset(x: 0, y: 80)
            }
            }
        }
    }

