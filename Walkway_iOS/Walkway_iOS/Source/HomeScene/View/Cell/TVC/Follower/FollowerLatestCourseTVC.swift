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
        titleLabel.font = .boldSystemFont(ofSize: 13)
        
        dateLabel.textColor = .bookmarkDarkBlue
        dateLabel.font = .boldSystemFont(ofSize: 13)
        dateLabel.text = "201021"
        
        infoLabel.font = .systemFont(ofSize: 13, weight: .medium)
        infoLabel.text = "10km / 2시간 30분"
    }
}

// MARK: - Data
extension FollowerLatestCourseTVC {
    func setTitle(title: String) {
        titleLabel.text = title
    }
}
