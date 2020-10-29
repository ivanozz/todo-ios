//
//  TodoListViewModel.swift
//  ToDoList
//
//  Created by admin on 29.10.2020.
//

import Foundation
import Combine

protocol TodoListViewModelProtocol {
    var todos: [Todo] { get }
    var showCompleted: Bool { get set }
    func fetchTodos()
    func toggleIsCompleted(for todo: Todo)
}

final class TodoListViewModel: ObservableObject {
    @Published var todos = [Todo]()
    @Published var showCompleted = false
    
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
        
        fetchTodos()
    }
}

extension TodoListViewModel: TodoListViewModelProtocol {
    
    func fetchTodos() {
        todos = dataManager.fetchTodoList(includingCompleted: showCompleted)
    }
    
    func toggleIsCompleted(for todo: Todo) {
        dataManager.toggleIsCompleted(for: todo)
    }
    
}
