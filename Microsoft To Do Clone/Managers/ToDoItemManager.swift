//
//  ToDoItemManager.swift
//  Microsoft To Do Clone
//
//  Created by Nickelfox on 31/05/24.
//

import Foundation
import CoreData

struct ToDoItemManager {
    
    private let _toDoItemDataRepository = ToDoItemDataRepository()
    
    func createToDoItem(toDoItem : ToDoItem) {
        _toDoItemDataRepository.create(todoItem: toDoItem)
    }
    
    func fetchToDoItem() -> [ToDoItem]? {
        return _toDoItemDataRepository.getAll()
        
    }
    
    func updateToDoItem(todoItem: ToDoItem) -> Bool {
            
        return _toDoItemDataRepository.update(todoItem: todoItem)
        }

        func deleteToDoItem(id: UUID) -> Bool {
            return _toDoItemDataRepository.delete(id: id)
        }
}
