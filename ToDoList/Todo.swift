//
//  Todo.swift
//  ToDoList
//
//  Created by admin on 29.10.2020.
//

import Foundation

struct Todo: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted = false
}
