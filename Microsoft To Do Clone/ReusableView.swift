//
//  ReusableView.swift
//  Microsoft To Do Clone
//
//  Created by Nickelfox on 31/05/24.
//

import Foundation
import UIKit

class ReusableView : UIView {
    
    private let titleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .left
            return label
        }()
    private let detailLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            return label
        }()
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
        }
    required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupView()
        }
    private func setupView() {
            addSubview(titleLabel)
            addSubview(detailLabel)
            
            NSLayoutConstraint.activate([
                titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
                detailLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
            ])
        }
    func configure(backgroundColor: UIColor, title: String, detail: String) {
            self.backgroundColor = backgroundColor
            titleLabel.text = title
            detailLabel.text = detail
        }
}
