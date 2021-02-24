//
//  CourseRecordInfoTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

class CourseRecordInfoTVC: UITableViewCell {
    static let identifier = "CourseRecordInfoTVC"
    
    @IBOutlet var recordDateandTimeLabel: UILabel!
    @IBOutlet var recordCourseNameLabel: UILabel!
    @IBOutlet var recordCourseTimeTitleLabel: UILabel!
    @IBOutlet var recordCourseTimeLabel: UILabel!
    @IBOutlet var recordCourseDistanceTitleLabel: UILabel!
    @IBOutlet var recordCourseDistanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

// MARK: - UI
extension CourseRecordInfoTVC {
    func setUI() {
        setLabel()
    }
    
    func setLabel() {
        recordDateandTimeLabel.font = .systemFont(ofSize: 10, weight: .bold)
        recordDateandTimeLabel.textColor = .systemIndigo
        recordDateandTimeLabel.text = "2020/12/10 - 19:14"
        recordCourseNameLabel.font = .systemFont(ofSize: 17, weight: .bold)
        recordCourseNameLabel.textColor = .black
        recordCourseNameLabel.text = "관악산 달빛 둘레길"
        recordCourseDistanceTitleLabel.font = .systemFont(ofSize: 10, weight: .bold)
        recordCourseDistanceTitleLabel.textColor = .systemIndigo
        recordCourseDistanceTitleLabel.text = "함께한 거리"
        recordCourseTimeTitleLabel.font = .systemFont(ofSize: 10, weight: .bold)
        recordCourseTimeTitleLabel.textColor = .systemIndigo
        recordCourseTimeTitleLabel.text = "함께한 시간"
        recordCourseDistanceLabel.font = .systemFont(ofSize: 40, weight: .bold)
        recordCourseDistanceLabel.textColor = .black
        recordCourseDistanceLabel.text = "0.03"
        recordCourseTimeLabel.font = .systemFont(ofSize: 40, weight: .bold)
        recordCourseTimeLabel.textColor = .black
        recordCourseTimeLabel.text = "02:09"
    }
}
