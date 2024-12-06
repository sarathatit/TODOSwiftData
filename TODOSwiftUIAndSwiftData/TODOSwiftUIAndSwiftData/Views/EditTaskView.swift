//
//  EditTaskView.swift
//  TODOSwiftUIAndSwiftData
//
//  Created by Sarath kumar on 06/12/24.
//

import SwiftUI
import SwiftData

struct EditTaskView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Bindable var task: Task
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Edit Your Task:-")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(alignment: .leading) {
                TextField("Title", text: $task.title)
                TextField("Description", text: $task.subTitle)
                Toggle("Completed", isOn: $task.isCompleted)
            }
            .padding()
            .background(.yellow.opacity(0.7))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            .navigationTitle("Edit your view")
            .toolbar(content: {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss()
                    }
                }
            })
            
            Spacer()
        }
    }
}

#Preview {
    EditTaskView(task: Task.init(title: "", subTitle: "", isCompleted: false))
}
