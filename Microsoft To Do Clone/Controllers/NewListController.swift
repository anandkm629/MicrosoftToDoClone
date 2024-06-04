//
//  NewListController.swift
//  Microsoft To Do Clone
//
//  Created by Nickelfox on 29/05/24.
//

import Foundation
import UIKit

protocol AddItemDelegate: AnyObject {
    func addItem(_ name: String, _ imageName: String?)
}

class NewListController : UIViewController, UITextFieldDelegate {
    
    weak var delegate: AddItemDelegate?
    private let manager: ToDoItemManager = ToDoItemManager()
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var newListLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var emojiImage: UIImageView!
    @IBOutlet weak var colorBtn: UIButton!
    @IBOutlet weak var photoBtn: UIButton!
    @IBOutlet weak var customisedBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var createList: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self 
    }
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
       }
    
    @IBAction func cancelBtn(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let newItem = textField.text else { return }
        
        let imageName: String? = "line.3.horizontal"
        
        let newTask = ToDoItem(title:textField.text,imageData:nil,colorNumber: 4, id: UUID())
        
//        let appDelegate = AppDelegateHelper.shared.appDelegate
//        let context = appDelegate.persistentContainer.viewContext
        
        manager.createToDoItem(toDoItem: newTask)
        
        
        delegate?.addItem(newItem, imageName)
        
        navigationController?.popViewController(animated: true)
        //dismiss(animated: true, completion: nil)
    }

    
    
}
