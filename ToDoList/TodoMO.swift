//
//  TodoMO.swift
//  ToDoList
//
//  Created by admin on 30.10.2020.
//

import CoreData

@objc(TodoMO)
final class TodoMO: NSManagedObject {
    @NSManaged var uuid: UUID?
    @NSManaged var title: String
    @NSManaged var isCompleted: Bool
}

extension TodoMO {
    func convertToTodo() -> Todo {
        Todo(id: uuid ?? UUID(), title: title, isCompleted: isCompleted)
    }
}
