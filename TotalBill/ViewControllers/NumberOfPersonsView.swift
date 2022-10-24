//
//  NumberOfPersonsView.swift
//  TotalBill
//
//  Created by Alik Nigay on 22.10.2022.
//

import UIKit

class NumberOfPersonsView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Persons"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let backGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        button.tintColor = #colorLiteral(red: 0.4513477087, green: 0.4857000113, blue: 0.5633345246, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        button.tintColor = #colorLiteral(red: 0.4513477087, green: 0.4857000113, blue: 0.5633345246, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let countPeople: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var count = 1
    
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
        minusButton.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: frame.height / 2)
        plusButton.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: frame.height / 2)
        countPeople.font = UIFont(name: "Avenir Next Bold", size: frame.height / 2.6)
    }
}

//MARK: - Private Methods
extension NumberOfPersonsView {
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backGrayView)
        addSubview(titleLabel)
        
        backGrayView.addSubview(minusButton)
        backGrayView.addSubview(plusButton)
        backGrayView.addSubview(countPeople)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
            backGrayView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            backGrayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backGrayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backGrayView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            minusButton.topAnchor.constraint(equalTo: backGrayView.topAnchor, constant: 0),
            minusButton.leadingAnchor.constraint(equalTo: backGrayView.leadingAnchor, constant: 0),
            minusButton.heightAnchor.constraint(equalTo: backGrayView.heightAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 80),
            
            plusButton.topAnchor.constraint(equalTo: backGrayView.topAnchor, constant: 0),
            plusButton.trailingAnchor.constraint(equalTo: backGrayView.trailingAnchor, constant: 0),
            plusButton.heightAnchor.constraint(equalTo: backGrayView.heightAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 80),
            
            countPeople.centerYAnchor.constraint(equalTo: backGrayView.centerYAnchor),
            countPeople.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor),
            countPeople.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor),
        ])
    }
    
    @objc private func minusButtonPressed() {
        count -= 1
        countPeople.text = "\(count)"
        if count == 1 {
            minusButton.isEnabled = false
        }
    }
    
    @objc private func plusButtonPressed() {
        count += 1
        countPeople.text = "\(count)"
        minusButton.isEnabled = true
    }
}
