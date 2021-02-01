//
//  MessageTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/01.
//

import UIKit

class MessageTVC: UITableViewCell {
    static let identifier = "MessageTVC"

    @IBOutlet weak var profileImage: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - UI
extension MessageTVC {
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
        nameLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        nameLabel.textColor = .gray90
        
        contentLabel.font = .systemFont(ofSize: 11, weight: .medium)
        contentLabel.textColor = .gray60
    }
}

// MARK: - Data
extension MessageTVC {
    func setData(data: Message) {
        contentLabel.text = data.content
        nameLabel.text = data.name
    }
}
