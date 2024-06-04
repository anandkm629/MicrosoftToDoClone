//
//  TasksListViewController.swift
//  Microsoft To Do Clone
//
//  Created by Nickelfox on 27/05/24.
//

import UIKit

class TasksListViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var createGroupLabel: UILabel!
    
    @IBOutlet weak var createGrpBtn: UIButton!
    
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var groupTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupTextField.delegate = self

    }
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
       }
    
    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
