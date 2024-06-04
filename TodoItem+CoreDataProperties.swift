//
//  TodoItem+CoreDataProperties.swift
//  Microsoft To Do Clone
//
//  Created by Nickelfox on 03/06/24.
//
//

import Foundation
import CoreData


extension UserTodoItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserTodoItem> {
        return NSFetchRequest<UserTodoItem>(entityName: "UserTodoItem")
    }

    @NSManaged public var colorNumber: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    
    func convertToItems() -> ToDoItem
    {
        
         return ToDoItem(title: self.title ,colorNumber: self.colorNumber, id: self.id!)
         
     }

}

extension UserTodoItem : Identifiable {

}
