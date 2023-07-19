//
//  DetailView.swift
//  SwiftUIViewLifeCycle
//
//  Created by Роман Горностаев on 19.07.2023.
//

import SwiftUI

struct DetailView: View {
    
    var fruitName: String
    
    var body: some View {
        Text(fruitName)
            .font(.largeTitle)
            .navigationBarTitle(Text(fruitName), displayMode: .inline)
            .onAppear { print("🍎 OnAppear") }
            .onDisappear { print("🍎 OnDisappear") }
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(fruitName: "Blueberries 🫐")
    }
}
