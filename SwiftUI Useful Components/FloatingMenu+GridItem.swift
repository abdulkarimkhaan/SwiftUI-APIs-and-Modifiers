//
//  FloatingMenu.swift
//  SwiftUI Useful Components
//
//  Created by Abdul Karim Khan on 09/09/2024.
//

import SwiftUI

struct FloatingMenu: View {
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]

    var body: some View {
        VStack {
            Text("Floating Menu")
                .bold()
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(0..<10, id: \.self) { index in
                        ImageView()
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .scrollIndicators(.hidden)
    }
}

struct ImageView: View {
    var body: some View {
        Image("Abdul-Karim-Khan")
            .resizable()
            .frame(height: 220)
            .contextMenu(ContextMenu(menuItems: {
                Button(action: {
                    // Edit action
                }) {
                    Label("Edit", systemImage: "pencil")
                }
                Button(action: {
                    // Share action
                }) { Label("Share", systemImage: "square.and.arrow.up")
                }
                Button(action: {
                    // Delete action
                }) {
                    Label("Delete", systemImage: "trash")
                }
            }))
            .clipShape(RoundedRectangle(cornerRadius: 14.0))
    }
}


