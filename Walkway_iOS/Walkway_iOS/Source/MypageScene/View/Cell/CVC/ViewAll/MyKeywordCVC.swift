//
//  MyKeywordCVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

class MyKeywordCVC: UICollectionViewCell {
    static let identifier = "MyKeywordCVC"
    
    @IBOutlet var keywordButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setData(keyword: String) {
        keywordButton.setTitle(keyword, for: .normal)
    }
}

// MARK: - UI
extension MyKeywordCVC {
    func setUI() {
        setButton()
    }
    
    func setButton() {
        keywordButton.setTitle("", for: .normal)
        keywordButton.backgroundColor = .systemIndigo
        keywordButton.tintColor = .white
        keywordButton.layer.cornerRadius = 12
    }
}
