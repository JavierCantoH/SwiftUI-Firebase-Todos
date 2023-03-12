//
//  Priority.swift
//  App05-Firebase-Todos
//
//  Created by Luis Javier Canto Hurtado on 28/10/21.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Priority: Identifiable, Codable {
    
    @DocumentID var id: String?
    var priority_id: String
    var priority: String
    var image: String

    enum CodingKeys: String, CodingKey {
        case id
        case priority_id
        case priority
        case image
    }
    
}

extension Priority {
    
    static let dummyPriority = Priority(id: "01", priority_id: "01", priority: "Normal", image: "hand.point.right.fill")
    
}
