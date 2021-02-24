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
        recordDateandTimeLabel.font = .myBoldSystemFont(ofSize: 13)
        recordDateandTimeLabel.textColor = .bookmarkDarkBlue
        recordDateandTimeLabel.text = "2020/12/10 - 19:14"
        
        recordCourseNameLabel.font = .myBoldSystemFont(ofSize: 17)
        recordCourseNameLabel.text = "관악산 달빛 둘레길"
        
        recordCourseDistanceTitleLabel.font = .myBoldSystemFont(ofSize: 13)
        recordCourseDistanceTitleLabel.textColor = .bookmarkDarkBlue
        recordCourseDistanceTitleLabel.text = "함께한 거리"
        
        recordCourseTimeTitleLabel.font = .myBoldSystemFont(ofSize: 13)
        recordCourseTimeTitleLabel.textColor = .bookmarkDarkBlue
        recordCourseTimeTitleLabel.text = "함께한 시간"
        
        recordCourseDistanceLabel.font = .myBoldSystemFont(ofSize: 40)
        recordCourseDistanceLabel.text = "0.03"
        
        recordCourseTimeLabel.font = .myBoldSystemFont(ofSize: 40)
        recordCourseTimeLabel.text = "02:09"
    }
}
