//
//  CustomTableViewCell.swift
//  Microsoft To Do Clone
//
//  Created by Nickelfox on 27/05/24.
//

import UIKit
//
protocol CustomTableViewCellDelegate: AnyObject {
    func buttonTapped(_ cell: CustomTableViewCell)
}

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var customImageView : UIImageView!
    @IBOutlet weak var customButton: UIButton!
    weak var delegate: CustomTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        customImageView.isUserInteractionEnabled = false
      
        // Initialization code
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
            delegate?.buttonTapped(self)
        guard let imageView = customImageView else { return  }
            let isOverlapping = isButtonOverlappingImageView(button: sender, imageView: imageView)
            
            if isOverlapping {
                print("The button and the image view are overlapping.")
            } else {
                print("The button and the image view are not overlapping.")
            }
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func isButtonOverlappingImageView(button: UIButton, imageView: UIImageView) -> Bool {
        return button.frame.intersects(imageView.frame)
    }

    
}
