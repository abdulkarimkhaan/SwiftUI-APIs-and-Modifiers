//
//  GridLayout.swift
//  SwiftUI Useful Components
//
//  Created by Abdul Karim Khan on 17/09/2024.
//

import SwiftUI

struct GridLayout: View {
    var body: some View {
        VStack (spacing: 30) {
            FlexibleGridView()
            FixedGridView()
            AdaptiveGridView()
        }
    }
}

#Preview {
    GridLayout()
}

//MARK: This configuration ensures that two columns share the available space equally.
struct FlexibleGridView: View {
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
     
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Text("Flexible Grid")
                .bold()
                .font(.title2)

            LazyVGrid(columns: columns) {
                ForEach(0..<4) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.randomDarkColor())
                        .frame(height: 100)
                        .overlay(Text("Item \(index)").foregroundColor(.white))
                }
            }
        }
        .padding(.horizontal)
    }
}

//MARK: In this example, each column is always 100 points wide, regardless of the device's screen size.
struct FixedGridView: View {
    let rows = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Text("Fixed Grid")
                .bold()
                .font(.title2)
            ScrollView (.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 10) {
                    ForEach(0..<20) { index in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.randomDarkColor())
                            .frame(width: 80, height: 100)
                            .overlay(Text("\(index)").foregroundColor(.white))
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

//MARK: In this setup, SwiftUI will automatically generate as many columns as possible, with each column being at least 100 points wide.
struct AdaptiveGridView: View {
    
    let gridItem = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Text("Adaptive Grid")
                .bold()
                .font(.title2)
            ScrollView (showsIndicators: false){
                LazyVGrid(columns: gridItem, spacing: 20) {
                    ForEach(0..<10) { index in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.randomDarkColor())
                            .frame(height: 100)
                            .overlay(Text("Item \(index)").foregroundColor(.white))
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}
