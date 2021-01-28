//
//  ReviewTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/26.
//

import UIKit

class ReviewTVC: UITableViewCell {
    static let identifier = "ReviewTVC"

    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
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
extension ReviewTVC {
    private func setUI() {
        setButton()
        setLabel()
    }
    
    private func setButton() {
        profileButton.setTitleColor(.white, for: .normal)
        profileButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
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
extension ReviewTVC {
    func setData(review: Review) {
        nameLabel.text = review.name
        dateLabel.text = review.date
        rateLabel.text = "⭐️\(review.rate)"
        contentLabel.text = review.content
        
        let start = String.Index(encodedOffset: 0)
        let capitalLetter = review.name[start].uppercased()
        profileButton.setTitle("\(capitalLetter)", for: .normal)
    }
}
