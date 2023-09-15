//
//  ContentView.swift
//  Assignment2
//
//  Created by Sunjun Kwak on 15/9/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Text("Contacts")
                .tabItem {
                    Image(systemName: "folder.fill")
                    Text("Contacts")
                }
            
            Text("Personalise")
                .tabItem {
                    Image(systemName: "slider.vertical.3")
                    Text("Personalise")
                }
        }
        /*VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
