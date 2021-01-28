//
//  HomeBookmarkCourseCVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/22.
//

import UIKit

class HomeBookmarkCourseCVC: UICollectionViewCell {
    static let identifier = "HomeBookmarkCourseCVC"

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet var hashtagButtons: [UIButton]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}

// MARK: - UI
extension HomeBookmarkCourseCVC {
    private func setUI() {
        setBackground()
        setLabel()
        setButtons()
        setStackView()
    }
    
    private func setBackground() {
        backView.backgroundColor = .popularLightBrown
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 10
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize(width: 1, height: 2)
        layer.shadowRadius = 3
    }
    
    private func setLabel() {
        titleLabel.text = "광화문 걸어보기"
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.textColor = .white
        titleLabel.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, constant: -self.frame.size.width/6).isActive = true
        
        timeLabel.text = "1시간"
        timeLabel.font = .systemFont(ofSize: 11)
        timeLabel.textColor = .white
        
        distanceLabel.text = "1km"
        distanceLabel.font = .systemFont(ofSize: 11)
        distanceLabel.textColor = .white
    }
    
    private func setButtons() {
        let title: [String] = ["#야경", "#경복궁", "#안동역"]
        let colors: [UIColor] = [.popularGreen, .popularBrown, .popularDarkBrown]
        var index = 0
        
        for btn in hashtagButtons {
            btn.layer.cornerRadius = 9
            btn.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
            btn.layer.shadowOpacity = 0.8
            btn.layer.shadowOffset = CGSize(width: 1, height: 2)
            btn.layer.shadowRadius = 2
            
            btn.setTitle(title[index], for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
            btn.backgroundColor = colors[index]
            btn.contentEdgeInsets = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
            btn.setTitleColor(.white, for: .normal)
            btn.isUserInteractionEnabled = false
            index += 1
        }
    }
    
    private func setStackView() {
        buttonStackView.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, constant: -20).isActive = true
    }
}
