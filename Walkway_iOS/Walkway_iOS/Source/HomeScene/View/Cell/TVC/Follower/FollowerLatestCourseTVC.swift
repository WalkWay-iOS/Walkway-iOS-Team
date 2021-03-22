//
//  FollowerLatestCourseTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/03.
//

import UIKit

class FollowerLatestCourseTVC: UITableViewCell {
    static let identifier = "FollowerLatestCourseTVC"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - UI
extension FollowerLatestCourseTVC {
    private func setUI() {
        setLabel()
    }
    
    private func setLabel() {
        titleLabel.font = .myBoldSystemFont(ofSize: 13)
        
        dateLabel.textColor = .bookmarkDarkBlue
        dateLabel.font = .myBoldSystemFont(ofSize: 13)
        
        infoLabel.font = .myRegularSystemFont(ofSize: 13)
    }
}

// MARK: - Data
extension FollowerLatestCourseTVC {
    func setTitle(data: Record) {
        titleLabel.text = data.courseName
        infoLabel.text = "\(data.distance)km / \(data.time)"
        
        let removeDate = data.createdAt.split(separator: "-")
        let yearString = removeDate[0].split(separator: "0")
        let dayString = removeDate[2].split(separator: "T")
        let dateString = "\(yearString[1])\(removeDate[1])\(dayString[0])"
        
        dateLabel.text = dateString
    }
}
