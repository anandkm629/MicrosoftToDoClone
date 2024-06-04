//
//  CustomViewController.swift
//  Microsoft To Do Clone
//
//  Created by Nickelfox on 04/06/24.
//

import Foundation
import UIKit

class CustomViewController : UIViewController  {
    
    
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    private var customTitle: String = ""
    private var customDetail: String = ""
    private var customBackgroundColor: UIColor = .white
    
    var backgroundColor: UIColor = .white {
            didSet {
                mainView.backgroundColor = backgroundColor
            }
        }
    
    override func viewDidLoad() {
           super.viewDidLoad()
           setupView()
       }
    
    func configure(title: String, detail: String, backgroundColor: UIColor) {
           self.customTitle = title
           self.customDetail = detail
           self.customBackgroundColor = backgroundColor
       }
    
    private func setupView() {
           titleLabel.text = customTitle
           detailLabel.text = customDetail
           mainView.backgroundColor = customBackgroundColor
       }
    
    @IBAction func backBtn(_sender: Any ) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}

