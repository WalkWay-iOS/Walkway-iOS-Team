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
        nameLabel.font = .myMediumSystemFont(ofSize: 13)
        nameLabel.textColor = .gray90
        
        contentLabel.font = .myRegularSystemFont(ofSize: 11)
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
