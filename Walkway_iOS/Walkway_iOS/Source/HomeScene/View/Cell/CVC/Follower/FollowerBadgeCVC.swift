//
//  FollowerBadgeCVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/03.
//

import UIKit

class FollowerBadgeCVC: UICollectionViewCell {
    static let identifier = "FollowerBadgeCVC"

    @IBOutlet weak var badgeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}

// MARK: - UI
extension FollowerBadgeCVC {
    private func setUI() {
        setView()
        setImageView()
    }
    
    private func setView() {
        self.backgroundColor = .bookmarkDarkBlue
        self.layer.cornerRadius = 22
    }
    
    private func setImageView() {
        badgeImageView.tintColor = .white
    }
}

// MARK: - Data
extension FollowerBadgeCVC {
    func setImage(image: String) {
        badgeImageView.image = UIImage(systemName: image)
    }
}
