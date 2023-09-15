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
        VStack(alignment: .leading, spacing: 20) { // Align content to the leading edge
            Text("Hello")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.black)
            
            Text("Quickly send a text message...")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.black)
            
            ZStack(alignment: .leading) { // Align content in the ZStack to the leading edge
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 331, height: 237)
                    .background(Color(red: 0.84, green: 0.97, blue: 0.85))
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                
                Button(action: {
                            // Put your action code here when the button is tapped
                            isShowingPopup = true // Show the popup when the button is tapped
                        }) {
                            ZStack {
                                Ellipse()
                                    .fill(Color.white)
                                    .frame(width: 51, height: 51)
                                    .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 4)
                                Image(systemName: "envelope")
                                    .foregroundColor(.black)
                                    .font(.system(size: 28))
                                   // .frame(width: 28, height: 20)
                            }
                        }
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

