//
//  ContentView.swift
//  ToDoList
//
//  Created by admin on 29.10.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, SwiftUI!")
            .padding()
            .foregroundColor(.green)
            .font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro Max")
    }
}
