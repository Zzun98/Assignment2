//
//  HomeView.swift
//  Assignment2
//
//  Created by Sunjun Kwak on 15/9/2023.
//

import Foundation
import SwiftUI
import MessageUI

struct HomeView: View {
    @State private var isShowingPopup = false
    @State private var groupName: String = ""
    let buttons: [(label: String, description: String)] = [
        ("Group 1", "Description 1"),
        ("Group 2", "Description 2"),
        ("Group 3", "Description 3")
    ]
    /*@IBAction func messageButtonPressed(_sender: UIButton) {
        guard MFMessageComposeViewController.canSendText() else {
            print("Cannot send text with this device")
            return
        }
        let composer = MFMessageComposeViewController()
        composer.recipients = ["1234556"]
        composer.subject = "Hello World"
        present(composer, animated: true)
    }*/
    
    
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
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 236)
                    .background(Color(red: 0.84, green: 0.97, blue: 0.85))
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                
                // These buttons are the 'Send text' buttons
                // The number of these buttons will depend on how many groups the user sets in "Contacts"
                VStack(alignment: .leading, spacing: 20) {
                        ForEach(buttons, id: \.label) { button in
                            Button(action: {
                                isShowingPopup = true
                                groupName = button.label
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
                                    Text(button.label)
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundColor(.black)
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
                    .padding(.horizontal, 20)
                }
            }
            .padding(.top, 20)
        }
    }


