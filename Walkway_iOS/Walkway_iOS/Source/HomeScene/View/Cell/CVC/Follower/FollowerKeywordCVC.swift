//
//  FollowerKeywordCVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/03.
//

import UIKit

class FollowerKeywordCVC: UICollectionViewCell {
    static let identifier = "FollowerKeywordCVC"

    @IBOutlet weak var keywordLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}

// MARK: - UI
extension FollowerKeywordCVC {
    private func setUI() {
        setView()
        setLabel()
    }
    
    private func setView() {
        self.layer.cornerRadius = 13
        self.backgroundColor = .gray50
    }
    
    private func setLabel() {
        keywordLabel.font = .systemFont(ofSize: 11, weight: .semibold)
        keywordLabel.textColor = .gray80
    }
}

// MARK: - Data
extension FollowerKeywordCVC {
    func setLabelText(text: String) {
        keywordLabel.text = "#\(text)"
    }
}
