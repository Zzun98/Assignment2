//
//  ContactView.swift
//  Assignment2
//
//  Created by Sunjun Kwak on 16/9/2023.
//

import Foundation
import SwiftUI
import ContactsUI

struct ContactView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Edit your contact groups")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.black)
            
            HStack {
                Text("Group /n")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                
                // Pressing this button will show a pop up screen asking the user if they really want to delete this group and if the user presses "Delete", the group will no longer exist
                Button(action: {
                                        // Put your action code here when the button is tapped
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                        .font(.system(size: 20))
                }
            }
            
            
            ZStack(alignment: .center) {
                // Once the user has added some people in this group, their names will be shown here
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 330, height: 236)
                    .background(Color(red: 0.84, green: 0.97, blue: 0.85))
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                
                // Tapping this button should allow users to change the members in a group
                Button(action: {
                            // Put your action code here when the button is tapped
                          
                        }) {
                            ZStack {
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: 260, height: 32)
                                    .cornerRadius(6)
                                    .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 4)
                                Text("Edit People")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.black)
                            }
                        }
                        .offset(x: 0, y: 80)

            }
            
            // Tapping this button should allow the user to newly name and create a group
            // If a user taps this button, a pop up message asking users to input a new name will be shown. Afterwards, if the user clicks 'Confirm', a new group with that name will be created.
            Button(action: {
                                    // Put your action code here when the button is tapped
                        }) {
                            ZStack {
                                Rectangle()
                                    .fill(Color.green)
                                    .frame(width: 300, height: 36)
                                    .cornerRadius(6)
                                    .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 4)
                                Text("Create a group")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                            }
                        }
        }
        .padding(.leading, 20) 
    }
}
