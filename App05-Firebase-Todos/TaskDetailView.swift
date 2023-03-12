//
//  TaskDetailView.swift
//  App05-Firebase-Todos
//
//  Created by Luis Javier Canto Hurtado on 28/10/21.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var taskModel: TaskModel
    @State var task: Task
    var mode: Mode
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        VStack {
            Form {
                Section(header:
                    Text("Datos tarea")
                        .font(.title2)
                ){
                    Text("Tarea:")
                        .font(.headline)
                    TextField("Tarea", text: $task.task)
                        .font(.body)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Toggle(isOn: $task.is_completed) {
                        Text("Tarea completada")
                            .font(.body)
                    }
                }
                Section(header:
                    Text("Categoria")
                        .font(.title2)
                ){
                    VStack {
                        CategoryView(taskModel: taskModel, task: $task)
                        
                    }
                }
                Section(header:
                    Text("Prioridad")
                        .font(.title2)
                ){
                    VStack {
                        PriorityView(taskModel: taskModel, task: $task)
                        
                    }
                }
                Section(header:
                    Text("Fechas")
                        .font(.title2)
                ){
                    DatePicker(selection: $task.due_date, in: task.date_created..., displayedComponents: .date) {
                        Text("\(dateFormat.string(from: task.due_date))")
                    }
                }

            }
            Spacer()
            Button {
                if mode == .edit {
                    taskModel.updateTask(task: task)
                } else {
                    taskModel.addTask(task: task)
                }
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Image(systemName: "pencil.circle.fill")
                    Text(mode == .edit ? "Editar" : "Guardar")
                        .font(.title2)
                }
                .padding()
                .foregroundColor(.white)
                .background(.green)
                .cornerRadius(20)
            }

        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(taskModel: TaskModel(), task: Task.dummy, mode: .edit)
    }
}
