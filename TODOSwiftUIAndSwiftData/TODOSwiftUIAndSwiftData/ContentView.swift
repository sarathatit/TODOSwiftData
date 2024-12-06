//
//  ContentView.swift
//  TODOSwiftUIAndSwiftData
//
//  Created by Sarath kumar on 05/12/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var task: [Task]
    @State private var isCompleted = false
    @State private var showAddTaskView = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(task) { task in
                    NavigationLink {
                        EditTaskView(task: task)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(task.title)
                            Text(task.subTitle)
                            Text(task.isCompleted ? "completed" : "Not completed")
                        }
                        .padding()
                        .background(.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 5, leading: 16, bottom: 5, trailing: 16))
                    
                }
                .onDelete(perform: { indexSet in
                    deleteTask(indexSet: indexSet)
                })
            }
            .listStyle(.plain)
            .navigationTitle("Task List")
            .toolbar(content: {
                Button("Add Task") {
                    showAddTaskView = true
                }
            })
            .navigationDestination(isPresented: $showAddTaskView) {
                AddTaskView()
            }
            
        }
    }
    
    private func deleteTask(indexSet: IndexSet) {
        for index in indexSet {
            let task = task[index]
            modelContext.delete(task)
        }
    }
}

#Preview {
    ContentView()
}
