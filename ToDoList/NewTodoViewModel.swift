//
//  NewTodoViewModel.swift
//  ToDoList
//
//  Created by admin on 29.10.2020.
//

import Foundation
import Combine

protocol NewTodoViewModelProtocol {
    func addNewTodo(title: String)
}

final class NewTodoViewModel: ObservableObject {
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
    }
}

extension NewTodoViewModel: NewTodoViewModelProtocol {
    func addNewTodo(title: String) {
        dataManager.addTodo(title: title)
    }
}
