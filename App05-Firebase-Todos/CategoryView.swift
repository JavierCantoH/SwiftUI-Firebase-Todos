//
//  CategoryView.swift
//  App05-Firebase-Todos
//
//  Created by Luis Javier Canto Hurtado on 28/10/21.
//

import SwiftUI

struct CategoryView: View {
    
    @ObservedObject var taskModel: TaskModel
    @Binding var task: Task
    
    var body: some View {
        VStack {
            Text(categoryName(task.category_id))
                .font(.title2)
            HStack {
                ForEach(taskModel.categories) { category in
                    VStack {
                        Image(category.image)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .opacity(category.category_id == task.category_id ? 1.0 : 0.2)
                            .onTapGesture {
                                task.category_id = category.category_id
                            }
                    }
                }
            }
        }
    }
    
    func categoryName(_ category_id: String) -> String {
        
        if let index = taskModel.categories.firstIndex(where: {
            $0.category_id == category_id
        }) {
            return taskModel.categories[index].category
        }
        return ""
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(taskModel: TaskModel(), task: .constant(Task.dummy))
    }
}
