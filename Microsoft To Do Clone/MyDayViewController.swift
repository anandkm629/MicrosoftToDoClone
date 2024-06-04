//
//  MyDayViewController.swift
//  Microsoft To Do Clone
//
//  Created by Nickelfox on 27/05/24.
//

import Foundation
import UIKit

class MyDayViewController : UIViewController {
    
    
    @IBOutlet weak var mainImg: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var myDayLabel: UILabel!
    
    @IBOutlet weak var addNoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func showMoreBtn(_ sender: Any) {
    }
    
}
