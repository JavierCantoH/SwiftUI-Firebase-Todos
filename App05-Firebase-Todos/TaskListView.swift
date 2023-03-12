//
//  ContentView.swift
//  App05-Firebase-Todos
//
//  Created by Luis Javier Canto Hurtado on 28/10/21.
//

import SwiftUI

struct TaskListView: View {
    
    @StateObject var taskModel = TaskModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(taskModel.tasks) { task in
                        NavigationLink(destination: TaskDetailView(taskModel: taskModel, task: task, mode: .edit)) {
                            VStack(alignment: .leading) {
                                Text(task.task)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            taskModel.removeTask(task: taskModel.tasks[index])
                        }
                    }
                }
                VStack {
                    Spacer()
                    NavigationLink(destination: TaskDetailView(taskModel: taskModel, task: Task.dummy, mode: .add)) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                        }
                    }
                }
            }
            .navigationBarTitle("Tareas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Tareas")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
