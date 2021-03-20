//
//  ReviewViewAllTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/05.
//

import UIKit

class ReviewViewAllTVC: UITableViewCell {
    static let identifier = "ReviewViewAllTVC"

    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - UI
extension ReviewViewAllTVC {
    private func setUI() {
        setButton()
        setLabel()
    }
    
    private func setButton() {
        profileButton.setTitleColor(.white, for: .normal)
        profileButton.titleLabel?.font = .myMediumSystemFont(ofSize: 13)
        profileButton.backgroundColor = .bookmarkDarkBlue
        profileButton.layer.cornerRadius = 15
        profileButton.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        profileButton.layer.shadowOpacity = 1.0
        profileButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        profileButton.layer.shadowRadius = 3
    }
    
    private func setLabel() {
        nameLabel.font = .systemFont(ofSize: 11, weight: .medium)
        nameLabel.textColor = .gray60
        
        dateLabel.font = .systemFont(ofSize: 11, weight: .medium)
        dateLabel.textColor = .gray60
        
        rateLabel.font = .systemFont(ofSize: 11, weight: .medium)
        rateLabel.textColor = .gray60
        
        contentLabel.font = .systemFont(ofSize: 11, weight: .medium)
        contentLabel.textColor = .gray70
    }
}

// MARK: - Data
extension ReviewViewAllTVC {
    func setData(review: Comments) {
        nameLabel.text = "tlsdbsdk0525"
        contentLabel.text = review.content
        profileButton.setTitle("T", for: .normal)
        
        let start = String.Index(encodedOffset: 2)
        let end = String.Index(encodedOffset: 8)
        let substring = String(review.createdAt[start..<end])
        
        dateLabel.text = substring
    }
}
