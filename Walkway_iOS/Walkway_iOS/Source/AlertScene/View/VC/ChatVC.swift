//
//  ChatVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/01.
//

import UIKit

class ChatVC: UIViewController {
    @IBOutlet weak var profileImage: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: - UI
extension ChatVC {
    private func setUI() {
        setBackground()
        setButton()
        setLabel()
    }
    
    private func setBackground() {
        view.backgroundColor = .gray30
    }
    
    private func setButton() {
        profileImage.layer.cornerRadius = 25
        profileImage.isUserInteractionEnabled = false
    }
    
    private func setLabel() {
        nameLabel.text = "따릉이"
        nameLabel.font = .systemFont(ofSize: 15, weight: .bold)
        nameLabel.textColor = .gray70
    }
}
