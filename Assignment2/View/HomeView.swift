//
//  HomeView.swift
//  Assignment2
//
//  Created by Sunjun Kwak on 15/9/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) { // Use VStack to stack the contents vertically with spacing
            Text("Hello")
                .font(
                    Font.custom("SF Pro", size: 28)
                        .weight(.semibold)
                )
                .foregroundColor(.black)
                .frame(width: 250, height: 38, alignment: .topLeading)
            
            Text("Quickly send a text message...")
                .font(
                    Font.custom("SF Pro", size: 20)
                        .weight(.semibold)
                )
                .foregroundColor(.black)
                .frame(width: 298, height: 28, alignment: .topLeading)
            
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 331, height: 237)
                    .background(Color(red: 0.84, green: 0.97, blue: 0.85))
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                
                Button(action: {
                    // Put your action code here when the button is tapped
                }) {
                    Image("Ellipse 1")
                        .frame(width: 51, height: 51)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 4)
                }
            }
        }
    }
}

