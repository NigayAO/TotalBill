//
//  ViewController.swift
//  TotalBill
//
//  Created by Alik Nigay on 22.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let logoImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "dollarsign.circle")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter the invoice amount and click \"Calculate\""
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let totalBillView = TotalBillView()
    
    private let numOfPersonsView = NumberOfPersonsView()
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 20)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 15
        button.backgroundColor = #colorLiteral(red: 0.639077723, green: 0.2492567599, blue: 0.6254395843, alpha: 1)
        button.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tipsView = TipsView()
    
    private var delegate: TipsViewDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupViews()
        setConstraints()
        
        addTap()
    }
}

//MARK: - Private methods
extension MainViewController {
    private func setupViews() {
        
        view.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        
        view.addSubview(titleLabel)
        titleLabel.font = UIFont(name: "Avenir Next Bold", size: view.frame.height * 0.046)
        
        view.addSubview(logoImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(totalBillView)
        view.addSubview(numOfPersonsView)
        view.addSubview(calculateButton)
        view.addSubview(tipsView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            logoImageView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            
            descriptionLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            totalBillView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            totalBillView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            totalBillView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            totalBillView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.145),
            
            numOfPersonsView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 10),
            numOfPersonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            numOfPersonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            numOfPersonsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.145),
            
            tipsView.topAnchor.constraint(equalTo: numOfPersonsView.bottomAnchor, constant: 10),
            tipsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tipsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tipsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.145),
            
            calculateButton.topAnchor.constraint(equalTo: tipsView.bottomAnchor, constant: 10),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06)
        ])
    }
    
    @objc private func calculateButtonPressed() {
        guard let total = totalBillView.someTF.text, let totalBill = Double(total) else { return }
        let result = (totalBill + totalBill * tipsView.tipsPercent) / Double(numOfPersonsView.count)
        descriptionLabel.text = "\(String(format: "%.2f", result)) per persons"
    }

    func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
