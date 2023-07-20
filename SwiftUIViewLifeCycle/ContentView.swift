//
//  ContentView.swift
//  SwiftUIViewLifeCycle
//
//  Created by Роман Горностаев on 18.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    private let fruits = ["Grape", "Cherry", "Banana", "Apple", "Pineapple", "Orange"]
    
    @State private var shouldShowSlider = false
    @State private var size: CGFloat = 18.0
    
    var body: some View {
        NavigationView {
            VStack {
                
                Section {
                    Toggle(isOn: $shouldShowSlider.animation(.easeInOut)) {
                        Text("Font resizing available")
                    }
                }
                .padding(shouldShowSlider ? .horizontal : .all )
                
                if shouldShowSlider {
                    slider(name: "Font size", value: $size, in: 12...30)
                        .padding(.horizontal)
                        .onAppear { print("🕹️ OnAppear") }
                        .onDisappear { print("🕹️ OnDisappear") }
                }
                
                Section {
                    List(fruits, id: \.self) { fruit in
                        NavigationLink(destination: DetailView(fruitName: fruit)) {
                            Text(fruit)
                                .font(.system(size: self.size))
                        }
                    }
                    .navigationBarTitle(Text("Fruits 🍇"))
                    .onAppear { print("📋 OnAppear") }
                    .onDisappear { print("📋 OnDisappear") }
                }
                
            }
        }
        .onAppear { print("🗂️ OnAppear") }
        .onDisappear { print("🗂️ OnDisappear") }
       
    }
    
    func slider<V>(name: String, value: Binding<V>,
                   in bounds: ClosedRange<V>,
                   onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) -> some View where V : BinaryFloatingPoint, V.Stride : BinaryFloatingPoint {
        HStack {
            Text("\(name)")
            Slider(value: value,
                   in: bounds,
                   onEditingChanged: onEditingChanged,
                   minimumValueLabel:  Text("\(Int(bounds.lowerBound))"),
                   maximumValueLabel:  Text("\(Int(bounds.upperBound))"),
                   label: { EmptyView() })
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
