//
//  TodoRow.swift
//  ToDoList
//
//  Created by admin on 29.10.2020.
//

import SwiftUI

struct TodoRow: View {
    var todo: Todo
    
    var body: some View {
        HStack {
            Image(systemName: todo.isCompleted ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(todo.isCompleted ? .blue : .black)
            Text(todo.title)
            Spacer()
        }
    }
}

struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodoRow(todo: Todo(title: "Buy groceries"))
            TodoRow(todo: Todo(title: "Visit a doctor", isCompleted: true))
        }
        .previewLayout(.fixed(width: 300, height: 44))
    }
}
