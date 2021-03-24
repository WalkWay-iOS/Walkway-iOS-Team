//
//  CourseKeywordCVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/17.
//

import UIKit

class CourseKeywordCVC: UICollectionViewCell {
    static let identifier = "CourseKeywordCVC"

    @IBOutlet weak var keywordLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}

extension CourseKeywordCVC {
    private func setUI() {
        setLabel()
    }
    
    private func setLabel() {
        keywordLabel.font = .myMediumSystemFont(ofSize: 11)
        keywordLabel.textColor = UIColor.black.withAlphaComponent(0.8)
    }
    
    func setData(keyword: String) {
        keywordLabel.text = keyword
    }
}
