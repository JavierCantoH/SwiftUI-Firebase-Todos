//
//  Category.swift
//  App05-Firebase-Todos
//
//  Created by Luis Javier Canto Hurtado on 28/10/21.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Category: Identifiable, Codable {
    
    @DocumentID var id: String?
    var category_id: String
    var category: String
    var image: String

    enum CodingKeys: String, CodingKey {
        case id
        case category_id
        case category
        case image
    }
    
}

extension Category {
    
    static let dummyCategory = Category(id: "01", category_id: "01", category: "Actividad", image: "sports")
    
}
