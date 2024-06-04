//
//  ImportantViewController.swift
//  Microsoft To Do Clone
//
//  Created by Nickelfox on 28/05/24.
//

import Foundation
import UIKit

class ImportantViewController : UIViewController {

    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var ImpLabel: UILabel!
    
    @IBOutlet weak var addImpLabel: UILabel!
    
    @IBOutlet weak var txtLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func showMoreBtn(_ sender: Any) {
    }
    
    
}
