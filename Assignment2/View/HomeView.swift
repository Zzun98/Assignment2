//
//  HomeView.swift
//  Assignment2
//
//  Created by Sunjun Kwak on 15/9/2023.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State private var isShowingPopup = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Hello")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.black)
            
            Text("Quickly send a text message...")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.black)
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 330, height: 236)
                    .background(Color(red: 0.84, green: 0.97, blue: 0.85))
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                
                // These buttons are the 'Send text' buttons
                // The number of these buttons will depend on how many groups the user sets in "Contacts"
                Button(action: {
                            isShowingPopup = true // Show the popup when the button is tapped
                        }) {
                            HStack {
                                    ZStack {
                                        Ellipse()
                                            .fill(Color.white)
                                            .frame(width: 50, height: 50)
                                            .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 4)
                                        Image(systemName: "envelope")
                                            .foregroundColor(.black)
                                            .font(.system(size: 28))
                                    }
                                    Text("Group /n") // Replace with your button description
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundColor(.black)
                                }
                        }
                        .offset(x: 20)
                
                        // If the user Clicks the action button 'Send text', everyone in that group will receive the same text message predefined in "Personalise"
                        .alert(isPresented: $isShowingPopup) {
                            Alert(
                                title: Text("Text this Group?"),
                                message: Text("Are you sure you want to text everyone in this group with your message?"),
                                primaryButton: .default(Text("Send text"), action: {
                                    // Put your action code here for the Action button
                                }),
                                secondaryButton: .cancel(Text("Cancel"))
                            )
                        }
            }
        }
        .padding(.leading, 20) // Add some padding to align with the tab bar or as needed
    }

}

