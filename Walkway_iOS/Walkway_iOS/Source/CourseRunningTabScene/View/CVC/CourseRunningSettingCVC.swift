//
//  CourseRunningSettingCVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/01/31.
//

import UIKit

class CourseRunningSettingCVC: UICollectionViewCell {

    @IBOutlet var settingMainLabel: UILabel!
    @IBOutlet var courseEndLabel: UILabel!
    @IBOutlet var LandmarkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        settingLabel()
    }
    
    func settingLabel () {
        settingMainLabel.text = "알림 설정"
        courseEndLabel.text = "코스 종료 알림"
        LandmarkLabel.text = "랜드 마크 알림"
    }
}
