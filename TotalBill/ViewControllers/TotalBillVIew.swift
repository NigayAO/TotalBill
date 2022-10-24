//
//  TotalBillVIew.swift
//  TotalBill
//
//  Created by Alik Nigay on 22.10.2022.
//

import UIKit

class TotalBillView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let someTF: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.tintColor = #colorLiteral(red: 0.639077723, green: 0.2492567599, blue: 0.6254395843, alpha: 1)
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        textField.placeholder = "0"
        textField.layer.cornerRadius = 10
        textField.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.font = UIFont(name: "Avenir Next Bold", size: frame.width / 26.7)
        someTF.font = UIFont(name: "Avenir Next Bold", size: frame.height / 2.6)
    }
}

//MARK: - UITextFieldDelegate
extension TotalBillView: UITextFieldDelegate {
    
}

//MARK: - Private Methods
extension TotalBillView {
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        someTF.delegate = self
        
        addSubview(titleLabel)
        
        addSubview(someTF)
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            someTF.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            someTF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            someTF.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            someTF.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            
        ])
    }
}
