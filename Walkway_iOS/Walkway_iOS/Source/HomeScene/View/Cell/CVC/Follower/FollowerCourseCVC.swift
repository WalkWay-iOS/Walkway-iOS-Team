//
//  FollowerCourseCVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/03.
//

import UIKit

class FollowerCourseCVC: UICollectionViewCell {
    static let identifier = "FollowerCourseCVC"

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}

// MARK: - UI
extension FollowerCourseCVC {
    private func setUI() {
        setView()
        setLabel()
    }
    
    private func setView() {
        backView.backgroundColor = .bookmarkDarkBlue
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 10
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize(width: 1, height: 2)
        layer.shadowRadius = 3
    }
    
    private func setLabel() {
        titleLabel.font = .myBoldSystemFont(ofSize: 15)
        titleLabel.textColor = .white

        distanceLabel.font = .myRegularSystemFont(ofSize: 13)
        distanceLabel.textColor = .gray30
        
        timeLabel.font = .myRegularSystemFont(ofSize: 13)
        timeLabel.textColor = .gray30
    }
}

// MARK: - Data
extension FollowerCourseCVC {
    func setTitle(course: Course) {
        titleLabel.text = course.title
        distanceLabel.text = "\(course.distance)km"
        timeLabel.text = course.time
    }
}
