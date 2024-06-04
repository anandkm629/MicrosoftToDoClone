//
//  ToDoItemDataRepository.swift
//  Microsoft To Do Clone
//
//  Created by Nickelfox on 31/05/24.
//

import Foundation
import CoreData

protocol ToDoItemRepository {
    
    func create(todoItem:ToDoItem)
    func getAll() -> [ToDoItem]
    func update(todoItem:ToDoItem) -> Bool
    func get(byIdentifier id: UUID) -> ToDoItem?
}

struct ToDoItemDataRepository {
    
    func create(todoItem: ToDoItem) {

            let toDoItem = UserTodoItem(context: PersistentStorage.shared.context)
            toDoItem.title = todoItem.title
           // toDoItem.imageData = todoItem.imageData
            toDoItem.colorNumber = todoItem.colorNumber
            toDoItem.id = todoItem.id
            PersistentStorage.shared.saveContext()
        
        }
    
    func getAll() -> [ToDoItem]? {

            let result = PersistentStorage.shared.fetchManagedObject(managedObject: UserTodoItem.self)

            var todoItems : [ToDoItem] = []

            result?.forEach({ (todoItem) in
                todoItems.append(todoItem.convertToItems())
            })

            return todoItems
        }
    
    func get(byIdentifier id: UUID) -> ToDoItem? {

           let result = getCDItem(byIdentifier: id)
           guard result != nil else {return nil}
           return result?.convertToItems()
       }
    
    func update(todoItem: ToDoItem) -> Bool {

        let cdItem = getCDItem(byIdentifier: todoItem.id)
            guard cdItem != nil else {return false}

            cdItem?.title = todoItem.title
           // cdItem?.imageData = todoItem.imageData
            cdItem?.colorNumber = todoItem.colorNumber
            
        
            PersistentStorage.shared.saveContext()
            return true
        }
    func delete(id: UUID) -> Bool {

            let cdItem = getCDItem(byIdentifier: id)
            guard cdItem != nil else {return false}

            PersistentStorage.shared.context.delete(cdItem!)
            PersistentStorage.shared.saveContext()
            return true
        }
    
    private func getCDItem(byIdentifier id: UUID) -> UserTodoItem? {
      
        let fetchRequest = NSFetchRequest<UserTodoItem>(entityName: "TodoData")
                let predicate = NSPredicate(format: "id==%@", id as CVarArg)

                fetchRequest.predicate = predicate
                do {
                    let result = try PersistentStorage.shared.context.fetch(fetchRequest).first

                    guard result != nil else {return nil}

                    return result

                } catch let error {
                    debugPrint(error)
                }

                return nil
    }
}
