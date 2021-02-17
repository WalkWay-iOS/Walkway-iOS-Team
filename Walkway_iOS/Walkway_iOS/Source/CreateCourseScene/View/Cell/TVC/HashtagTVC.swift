//
//  HashtagTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/29.
//

import UIKit

class HashtagTVC: UITableViewCell {
    static let identifier = "HashtagTVC"

    @IBOutlet weak var hashtagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - UI
extension HashtagTVC {
    private func setUI() {
        setLabel()
    }
    
    private func setLabel() {
        hashtagLabel.font = .myMediumSystemFont(ofSize: 13)
    }
}

// MARK: - Data
extension HashtagTVC {
    func setText(text: String) {
        hashtagLabel.text = "#\(text)"
    }
}
