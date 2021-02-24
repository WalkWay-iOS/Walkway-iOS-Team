//
//  CourseWalkingSettingNotificationCVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

class CourseWalkingSettingNotificationCVC: UICollectionViewCell {
    static let identifier = "CourseWalkingSettingNotificationCVC"
    
    @IBOutlet var viewTitleLabel: UILabel!
    @IBOutlet var stopSettingTitleLabel: UILabel!
    @IBOutlet var stopSwitch: UISwitch!
    @IBOutlet var landmarkSettingTitleLabel: UILabel!
    @IBOutlet var landmarkSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }
}

// MARK: - UI
extension CourseWalkingSettingNotificationCVC {
    func setUI() {
        setBackground()
        setLabel()
        setSwitch()
    }
    
    func setBackground() {
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
    }
    
    func setLabel() {
        viewTitleLabel.font = .myBoldSystemFont(ofSize: 20)
        viewTitleLabel.textColor = .bookmarkDarkBlue
        viewTitleLabel.text = "알림 설정"
        stopSettingTitleLabel.font = .myBoldSystemFont(ofSize: 15)
        stopSettingTitleLabel.textColor = .gray70
        stopSettingTitleLabel.text = "코스 종료 알림"
        landmarkSettingTitleLabel.font = .myBoldSystemFont(ofSize: 15)
        landmarkSettingTitleLabel.textColor = .gray70
        landmarkSettingTitleLabel.text = "랜드마크 알림"
    }
    
    func setSwitch() {
        stopSwitch.onTintColor = .bookmarkDarkBlue
        landmarkSwitch.onTintColor = .bookmarkDarkBlue
    }
}
