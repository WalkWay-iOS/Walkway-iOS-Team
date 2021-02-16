//
//  MyBadgeCVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

class MyBadgeCVC: UICollectionViewCell {
    static let identifier = "MyBadgeCVC"
    
    @IBOutlet var badgeButton: UIButton!
    @IBOutlet var badgeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setData(badge: String, image: String) {
        badgeLabel.text = badge
        badgeButton.setImage(UIImage(systemName: image), for: .normal)
    }
}

// MARK: - UI
extension MyBadgeCVC {
    func setUI() {
        setBackground()
        setLabel()
        setButton()
    }
    
    func setBackground() {
        layer.cornerRadius = 5
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
    }
    
    func setLabel() {
        badgeLabel.font = .systemFont(ofSize: 15, weight: .medium)
        badgeLabel.text = ""
    }
    
    func setButton() {
        badgeButton.setTitle("", for: .normal)
        badgeButton.backgroundColor = .systemIndigo
        badgeButton.tintColor = .white
        badgeButton.layer.cornerRadius = badgeButton.layer.frame.size.width/2
    }
}
