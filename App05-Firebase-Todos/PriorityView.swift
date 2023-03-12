//
//  PriorityView.swift
//  App05-Firebase-Todos
//
//  Created by Luis Javier Canto Hurtado on 28/10/21.
//

import SwiftUI

struct PriorityView: View {
    
    @ObservedObject var taskModel: TaskModel
    @Binding var task: Task
    
    var body: some View {
        VStack {
            Text(priorityName(task.priority_id))
                .font(.title2)
            HStack {
                ForEach(taskModel.priorities) { priority in
                    VStack {
                        Image(systemName: priority.image)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(priorityColor(priority.priority_id))
                            .opacity(priority.priority_id == task.priority_id ? 1.0 : 0.2)
                            .onTapGesture {
                                task.priority_id = priority.priority_id
                            }
                    }
                }
            }
        }
    }
    
    func priorityName(_ priority_id: String) -> String {
        
        if let index = taskModel.priorities.firstIndex(where: {
            $0.priority_id == priority_id
        }) {
            return taskModel.priorities[index].priority
        }
        return ""
        
    }
    
    func priorityColor(_ priority_id: String) -> Color {
        if priority_id == "01" {
            return Color.blue
        } else {
            if priority_id == "02" {
                return Color.red
            } else {
                return Color.purple
            }
        }
    }
}

struct PriorityView_Previews: PreviewProvider {
    static var previews: some View {
        PriorityView(taskModel: TaskModel(), task: .constant(Task.dummy))
    }
}

