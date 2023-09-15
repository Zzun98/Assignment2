//
//  PersonaliseView.swift
//  Assignment2
//
//  Created by Sunjun Kwak on 16/9/2023.
//

import Foundation
import SwiftUI

struct PersonaliseView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) { // Align content to the leading edge
            Text("Personalise your texts")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.black)
            
            Text("Text for Group /n")
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
                                   // .frame(width: 28, height: 20)
                            }
                        }

            }
        }
        .padding(.leading, 20) // Add some padding to align with the tab bar or as needed
    }
}
