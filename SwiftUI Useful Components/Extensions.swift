//
//  Extensions.swift
//  SwiftUI Useful Components
//
//  Created by Abdul Karim Khan on 17/09/2024.
//

import SwiftUI

//MARK: Color Extension
extension Color {
    static func randomDarkColor() -> Color {
        // Generate random values for RGB, but keep them low to ensure the color is dark
        let red = Double.random(in: 0.1...0.7)
        let green = Double.random(in: 0.1...0.7)
        let blue = Double.random(in: 0.1...0.7)
        return Color(red: red, green: green, blue: blue)
    }
}

//MARK: View Extension
extension View {
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
    
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
    
}

