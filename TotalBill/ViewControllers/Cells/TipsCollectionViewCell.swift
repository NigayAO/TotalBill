//
//  TipsCollectionViewCell.swift
//  TotalBill
//
//  Created by Alik Nigay on 23.10.2022.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {
    
    let percentLabel: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected == true {
                layer.borderWidth = 3
                layer.borderColor = #colorLiteral(red: 0.639077723, green: 0.2492567599, blue: 0.6254395843, alpha: 1)
                backgroundColor = .systemYellow
            } else {
                layer.borderWidth = 0
                backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        percentLabel.font = UIFont(name: "Avenir Next Bold", size: frame.height / 3.4)
    }
}

//MARK: - Private methods
extension TipsCollectionViewCell {
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        layer.cornerRadius = 10
        
        addSubview(percentLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            percentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            percentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            percentLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
