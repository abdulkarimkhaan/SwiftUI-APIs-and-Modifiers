//
//  4. Charts.swift
//  SwiftUI Useful Components
//
//  Created by Abdul Karim Khan on 08/10/2024.
//

import SwiftUI
import Charts

struct Items: Identifiable, Equatable {
    var name: String
    var count: Double
    var color: String
    var id = UUID()
}

struct Charts: View {
    @State private var analyticItems: [Items] = [
        .init(name: "Thread", count: 15, color: "Purple"),
        .init(name: "UI", count: 10, color: "Green"),
        .init(name: "API Failure", count: 3, color: "Yellow"),
        .init(name: "Hang", count: 6, color: "Pink")
    ]
    
    @State private var animatedData: [Items] = []
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Crashlytics")
                .font(.title)
                .bold()
            
            Spacer()
            
            Chart(animatedData) { item in
                BarMark(
                    x: .value("Items", item.name),
                    y: .value("Severity", item.count),
                    width: 40
                )
                .foregroundStyle(by: .value("Item Color", item.name))
            }
            
            Spacer()
            
            HStack {
                Chart(animatedData) { item in
                    SectorMark(angle: .value("Count", item.count))
                        .foregroundStyle(by: .value("Item Color", item.name))
                }
                Chart(animatedData) { item in
                    SectorMark(angle: .value("Count", item.count))
                        .foregroundStyle(by: .value("Item Color", item.name))
                }
            }
            .frame(height: 250)
            
            
            Button("Randomize Data") {
                randomizeData()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .background(.cyan.opacity(0.2))
        .onAppear {
            animatedData = analyticItems
        }
    }
    
    func randomizeData() {
        let newData = analyticItems.map { item -> Items in
            var newItem = item
            newItem.count = Double.random(in: 1...20)
            return newItem
        }
        
        withAnimation(.easeInOut(duration: 1)) {
            animatedData = newData
        }
    }
}


#Preview {
    Charts()
}
