//
//  TaskModel.swift
//  App05-Firebase-Todos
//
//  Created by Luis Javier Canto Hurtado on 28/10/21.
//

import SwiftUI
import FirebaseFirestore

class TaskModel: ObservableObject {
    
    @Published var tasks = [Task]()
    @Published var categories = [Category]()
    @Published var priorities = [Priority]()
    
    private let db = Firestore.firestore()
    
    init() {
        fetchTasks()
        fetchCategories()
        fetchPriorities()
    }
    
    func fetchTasks() {
        
        db.collection("Tasks").order(by: "due_date").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }

                self.tasks = documents.compactMap { queryDocumentSnapshot -> Task? in
                    return try? queryDocumentSnapshot.data(as: Task.self)
                }
            }
    }
    
    func fetchCategories() {
        
        db.collection("Category").order(by: "category_id").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }

                self.categories = documents.compactMap { queryDocumentSnapshot -> Category? in
                    return try? queryDocumentSnapshot.data(as: Category.self)
                }
            }
    }
    
    func fetchPriorities() {
        
        db.collection("Priority").order(by: "priority_id").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }

                self.priorities = documents.compactMap { queryDocumentSnapshot -> Priority? in
                    return try? queryDocumentSnapshot.data(as: Priority.self)
                }
            }
    }
    
    // Función para agregar datos a la base de datos
    func addTask(task: Task) {
        do {
            let _ = try db.collection("Tasks").addDocument(from: task)
        }
        catch {
            print(error)
        }
    }

    // Función para actualizar datos en la base de datos
    func updateTask(task: Task) {
        if let taskID = task.id {
            do {
                try db.collection("Tasks").document(taskID).setData(from: task)
            }
            catch {
                print("There was an error while trying to update a task \(error.localizedDescription).")
            }
        }
    }

    // Función para borrar datos de la base de datos
    func removeTask(task: Task) {
        if let taskID = task.id {
            db.collection("Tasks").document(taskID).delete { (error) in // (1)
                if let error = error {
                    print("Error removing document: \(error.localizedDescription)")
                }
            }
        }
    }
}
