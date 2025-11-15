//
//  Task.swift
//  TodoListMVVM
//
//  Created by Gustavo Souto Pereira on 06/11/25.
//

import SwiftUI

struct Task : Identifiable, Codable, Equatable{
    var id: UUID
    var title: String
    var date: Date
    var isCompleted: Bool
    
    init(id: UUID = .init(), title: String, date: Date, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.date = date
        self.isCompleted = isCompleted
    }
}

