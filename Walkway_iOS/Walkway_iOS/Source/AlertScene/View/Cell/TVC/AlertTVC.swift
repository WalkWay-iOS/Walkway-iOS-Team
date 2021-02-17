//
//  AlertTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/01.
//

import UIKit

class AlertTVC: UITableViewCell {
    static let identifier = "AlertTVC"

    @IBOutlet weak var profileImage: UIButton!
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
extension AlertTVC {
    private func setUI() {
        setBackground()
        setButton()
        setLabel()
    }
    
    private func setBackground() {
        backgroundColor = .clear
    }
    
    private func setButton() {
        profileImage.layer.cornerRadius = 21
        profileImage.isUserInteractionEnabled = false
    }
    
    private func setLabel() {
        contentLabel.font = .myMediumSystemFont(ofSize: 12)
        contentLabel.textColor = .gray70
    }
}

// MARK: - Data
extension AlertTVC {
    func setData(text: String) {
        contentLabel.text = text
    }
}
