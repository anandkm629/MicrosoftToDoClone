//
//  UserDetailController.swift
//  Microsoft To Do Clone
//
//  Created by Nickelfox on 28/05/24.
//

import Foundation
import UIKit

class UserDetailController : UIViewController {
    
    
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var manageAcctBtn: UIButton!
    @IBOutlet weak var addAccntBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
