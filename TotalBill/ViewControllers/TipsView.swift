//
//  TipsView.swift
//  TotalBill
//
//  Created by Alik Nigay on 23.10.2022.
//

import UIKit

private let tipsIdentifier = "tipsCell"

protocol TipsViewDelegate {
    var percentage: Double { get }
}

class TipsView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tips"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    var tipsPercent = 0.0
    
    private let tipsArray = ["0%", "10%", "15%", "20%"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 10
        setupViews()
        setConstraints()
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.font = UIFont(name: "Avenir Next Bold", size: frame.width / 26.7)
    }
}

//MARK: - Private Methods
extension TipsView: TipsViewDelegate {
    
    var percentage: Double {
        tipsPercent
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(collectionView)
        
        collectionView.register(TipsCollectionViewCell.self, forCellWithReuseIdentifier: tipsIdentifier)
    }
    
    private func setupDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}

//MARK: - UICollectionViewDelegate && UICollectionViewDataSource
extension TipsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tipsIdentifier, for: indexPath) as? TipsCollectionViewCell else { return UICollectionViewCell() }
        cell.percentLabel.text = tipsArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 1:
            tipsPercent = 0.1
        case 2:
            tipsPercent = 0.15
        case 3:
            tipsPercent = 0.2
        default:
            tipsPercent = 0
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension TipsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 4.8, height: collectionView.frame.width / 4.8)
    }
}
