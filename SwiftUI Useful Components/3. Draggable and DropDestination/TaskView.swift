//
//  TaskView.swift
//  SwiftUI-Daily-APIs
//
//  Created by Abdul Karim Khan on 22/09/2024.
//

import SwiftUI

enum Priority: String, Codable {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}

struct TaskView: View {
    
    @State var name: String
    @State var priority: Priority
    @State var percentageCompleted: String
    @State var dueDate: String
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text(priority.rawValue)
                    .font(.system(size: getScreenBounds().height * 0.015))
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background(
                        Capsule()
                            .fill(priority == .high ? .red.opacity(0.8) : .cyan)
                    )
                Spacer()
                Text(percentageCompleted)
                    .foregroundStyle(.white)
                    .font(.system(size: getScreenBounds().height * 0.015))
            }
            Text(name)
                .foregroundStyle(.white)
                .font(.system(size: getScreenBounds().height * 0.02))
                .fontWeight(.bold)
            Text("Due Date: " + dueDate)
                .foregroundStyle(.white)
                .font(.system(size: getScreenBounds().height * 0.016))
                .fontWeight(.semibold)
                .padding(.top, 10)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(red: 35/255, green: 35/255, blue: 37/255))
                .shadow(radius: 2)
        )
    }
}
