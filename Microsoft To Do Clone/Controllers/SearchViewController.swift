//
//  SearchViewController.swift
//  Microsoft To Do Clone
//
//  Created by Nickelfox on 30/05/24.
//

import Foundation
import UIKit

class SearchViewController : UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var moreBtn: UIButton!
    
    @IBOutlet weak var micBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        
    }
    
}
