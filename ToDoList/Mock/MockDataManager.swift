//
//  MockDataManager.swift
//  ToDoList
//
//  Created by admin on 29.10.2020.
//

import Foundation

class MockDataManager {
    private var todos: [Todo] = [Todo]()
    
    init() {
        todos = [
            Todo(id: UUID(), title: "Morning workout", isCompleted: false),
            Todo(id: UUID(), title: "Sign documents", isCompleted: false),
            Todo(id: UUID(), title: "Check email", isCompleted: true),
            Todo(id: UUID(), title: "Call boss", isCompleted: false),
            Todo(id: UUID(), title: "Buy groceries", isCompleted: false),
            Todo(id: UUID(), title: "Finish article", isCompleted: true),
            Todo(id: UUID(), title: "Pay bills", isCompleted: true)
        ]
    }
}

// MARK: - DataManagerProtocol
extension MockDataManager: DataManagerProtocol {
    func fetchTodoList(includingCompleted: Bool = false) -> [Todo] {
        includingCompleted ? todos : todos.filter { !$0.isCompleted }
    }
    
    func addTodo(title: String) {
        let todo = Todo(title: title)
        todos.insert(todo, at: 0)
    }
    
    func toggleIsCompleted(for todo: Todo) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted.toggle()
        }
    }
}
