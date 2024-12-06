//
//  AddTaskView.swift
//  TODOSwiftUIAndSwiftData
//
//  Created by Sarath kumar on 06/12/24.
//

import SwiftUI
import SwiftData

struct AddTaskView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var description = ""
    @State private var isCompleted = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                // MARK: - Task Creation View
                VStack {
                    Text("Create Your Task:-")
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(alignment: .leading) {
                        TextField("Title", text: $title)
                        TextField("Description", text: $description)
                        Toggle("isCompleted", isOn: $isCompleted)
                    }
                    .padding()
                    .background(.yellow.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
                // MARK: - Preview View
                
                VStack {
                    Text("Your Preview:-")
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(title)
                        Text(description)
                        Text(isCompleted ? "Complete" : "Not Complete")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(.green.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Do your activity")
            .toolbar(content: {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newTask = Task(title: title, subTitle: description, isCompleted: isCompleted)
                        modelContext.insert(newTask)
                        dismiss()
                    }
                }
            })
        }
    }
}

#Preview {
    AddTaskView()
}
