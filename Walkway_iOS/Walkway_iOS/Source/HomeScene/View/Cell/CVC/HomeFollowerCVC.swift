//
//  HomeFollowerCVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/22.
//

import UIKit

class HomeFollowerCVC: UICollectionViewCell {
    static let identifier = "HomeFollowerCVC"
    
    @IBOutlet weak var followerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}

// MARK: - UI
extension HomeFollowerCVC {
    private func setUI() {
        setBackground()
        setImage()
        setLabel()
    }
    
    private func setBackground() {
        layer.cornerRadius = 5
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
    }
    
    private func setImage() {
        followerImage.layer.cornerRadius = 20
    }
    
    private func setLabel() {
        nameLabel.text = "NoName"
        nameLabel.font = .systemFont(ofSize: 11, weight: .bold)
    }
}
