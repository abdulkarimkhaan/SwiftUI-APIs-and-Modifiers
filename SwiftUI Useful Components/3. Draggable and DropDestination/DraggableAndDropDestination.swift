//
//  DraggableAndDropDestination.swift
//  SwiftUI Userful Component
//
//  Created by Abdul Karim Khan on 21/09/2024.
//

import SwiftUI
import UniformTypeIdentifiers

struct Task: Hashable, Transferable, Codable {
    var name: String
    var priority: Priority
    var percentageCompleted: String
    var isCompleted: Bool = false
    var startTime: String?
    var endTime: String?
    var dueDate: String
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .content)
    }
}


struct DraggableAndDropDestination: View {
    
    @State private var tasks: [Task] = [
        Task(name: "Apps Revamp", priority: .high, percentageCompleted: "30%", dueDate: "16-11-24"),
        Task(name: "Upload Data", priority: .medium, percentageCompleted: "60%", dueDate: "16-11-24"),
        Task(name: "Crypto UI", priority: .low, percentageCompleted: "90%", dueDate: "16-11-24"),
        Task(name: "Check Stocks", priority: .high, percentageCompleted: "20%", dueDate: "16-11-24"),
        Task(name: "QA Apps", priority: .high, percentageCompleted: "30%", dueDate: "16-11-24"),
        Task(name: "Update Env", priority: .medium, percentageCompleted: "60%", dueDate: "16-11-24"),
        Task(name: "Update Github", priority: .low, percentageCompleted: "90%", dueDate: "16-11-24"),
        Task(name: "Check Github", priority: .high, percentageCompleted: "20%", dueDate: "16-11-24")
    ]
    
    @State private var inProgressTasks: [Task] = []
    @State private var completedTasks: [Task] = []
    
    @State private var isTargetedTaskToDo = false
    @State private var isTargetedTaskInProgress = false
    @State private var isTargetedTaskComplete = false

    var body: some View {
        VStack {
            Text("Task Management")
                .bold()
                .font(.title2)
                .padding()
            VStack (alignment: .leading) {
                Text("Task ToDo")
                    .bold()
                    .font(.title3)
                    .padding(.leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(tasks, id: \.self) { task in
                            TaskView(name: task.name, priority: task.priority, percentageCompleted: task.percentageCompleted, dueDate: task.dueDate)
                                .draggable(task)
                        }
                    }
                    .padding(.leading)
                }
                .dropDestination(for: Task.self) { droppedTask, location in
                    for task in droppedTask {
                        tasks.removeAll{$0.name == task.name}
                        inProgressTasks.removeAll { $0.name == task.name }
                        completedTasks.removeAll { $0.name == task.name }
                    }
                    tasks.insert(contentsOf: droppedTask, at: 0)
                    return true
                } isTargeted: { isOver in
                    isTargetedTaskToDo = isOver
                }
                .background(isTargetedTaskToDo ? .red.opacity(0.8) : .red.opacity(0.6))
            }
            .scaleEffect(isTargetedTaskToDo ? 1.05 : 1)
            .animation(.easeInOut, value: isTargetedTaskToDo)
            .padding(.bottom, 10)

            VStack (alignment: .leading) {
                Text("Task InProgress")
                    .bold()
                    .font(.title3)
                    .padding(.leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(inProgressTasks, id: \.self) { task in
                            TaskView(name: task.name, priority: task.priority, percentageCompleted: task.percentageCompleted, dueDate: task.dueDate)
                                .draggable(task)
                        }
                    }
                    .padding(.leading)
                }
                .dropDestination(for: Task.self) { droppedTask, location in
                    for task in droppedTask {
                        inProgressTasks.removeAll{$0.name == task.name}
                        tasks.removeAll { $0.name == task.name }
                        completedTasks.removeAll { $0.name == task.name }
                    }
                    inProgressTasks.insert(contentsOf: droppedTask, at: 0)
                    return true
                } isTargeted: { isOver in
                    isTargetedTaskInProgress = isOver
                }
                .background(isTargetedTaskInProgress ? .indigo.opacity(0.8) : .indigo.opacity(0.6))
            }
            .scaleEffect(isTargetedTaskInProgress ? 1.05 : 1)
            .animation(.easeInOut, value: isTargetedTaskInProgress)
            .padding(.bottom, 10)

            VStack (alignment: .leading) {
                Text("Task Done")
                    .bold()
                    .font(.title3)
                    .padding(.leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(completedTasks, id: \.self) { task in
                            TaskView(name: task.name, priority: task.priority, percentageCompleted: task.percentageCompleted, dueDate: task.dueDate)
                                .draggable(task)
                        }
                    }
                }
                .dropDestination(for: Task.self) { droppedTask, location in
                    for task in droppedTask {
                        completedTasks.removeAll{$0.name == task.name}
                        tasks.removeAll { $0.name == task.name }
                        inProgressTasks.removeAll { $0.name == task.name }
                    }
                    completedTasks.insert(contentsOf: droppedTask, at: 0)
                    return true
                } isTargeted: { isOver in
                    isTargetedTaskComplete = isOver
                }
                .padding()
                .background(isTargetedTaskComplete ? .green.opacity(0.8) : .green.opacity(0.6))
            }
            .scaleEffect(isTargetedTaskComplete ? 1.05 : 1)
            .animation(.easeInOut, value: isTargetedTaskComplete)

        }
        .frame(maxWidth: .infinity) // Ensures Rectangle occupies the full width
    }
    
}

#Preview {
    DraggableAndDropDestination()
}
