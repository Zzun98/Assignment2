//
//  ContactView.swift
//  Assignment2
//
//  Created by Sunjun Kwak on 16/9/2023.
//

import Foundation
import SwiftUI
import Contacts
//import ContactsUI

struct ContactView: View {
    @State private var isShowingPopup2 = false
    @State private var isShowingPopup3 = false
    @State private var groupName: String = ""
    @State private var newGroupName: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Edit your contact groups")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.black)
            
            HStack {
                Text("Group \(groupName)")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                
                // Pressing this button will show a pop up screen asking the user if they really want to delete this group and if the user presses "Delete", the group will no longer exist
                Button(action: {
                    isShowingPopup2 = true
                    // Put your action code here when the button is tapped
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                        .font(.system(size: 20))
                }
            }
            .alert(isPresented: $isShowingPopup2) {
                Alert(
                    title: Text("Delete Group?"),
                    message: Text("Are you sure you want to delete this group?"),
                    primaryButton: .default(Text("Delete"), action: {
                        // Put your action code here for the Action button
                    }),
                    secondaryButton: .cancel(Text("Cancel"))
                )
            }
            
            ZStack(alignment: .center) {
                // Once the user has added some people in this group, their names will be shown here
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 236)
                    .background(Color(red: 0.84, green: 0.97, blue: 0.85))
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                
                // Tapping this button should allow users to change the members in a group
                Button(action: {
                    // Put your action code here when the button is tapped
                    Task.init {
                        await showContactPicker()
                    }
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
            VStack {
                Spacer()
                Button(action: {
                    isShowingPopup3.toggle()
                    // Put your action code here when the button is tapped
                }) {
                    ZStack {
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: 36)
                            .cornerRadius(6)
                            .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 4)
                        Text("Create a group")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                .alert("Name your new group", isPresented: $isShowingPopup3) {
                    TextField("Name your new group", text: $newGroupName)
                    Button("Confirm")
                    {
                        // Write logic for the Confirm button here, which ideally should create a new rectangle
                    }
                }
                Spacer().frame(height: 40)
            }
        }
    }
    
    func showContactPicker() async {
        let store = CNContactStore()
        let keys = [CNContactGivenNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
        
        do {
            try store.enumerateContacts(with: fetchRequest, usingBlock: { contact, result in
                print(contact.givenName)
                for number in contact.phoneNumbers {
                    switch number.label {
                    case CNLabelPhoneNumberMobile:
                        print("- Mobile: \(number.value.stringValue)")
                    case CNLabelPhoneNumberMain:
                        print("- Main: \(number.value.stringValue)")
                    default:
                        print("- Other: \(number.value.stringValue)")
                    }
                    print("- \(number.label): \(number.value.stringValue)")
                }
            })
        }
        catch {
            print("Error")
        }
        
    }
}
