//
//  CourseListTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/01/27.
//

import UIKit

class CourseListTVC: UITableViewCell {
    static let identifier = "CourseListTVC"
    
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var courseDistanceLabel: UILabel!
    @IBOutlet var courseTimeLabel: UILabel!
    @IBOutlet var courseStarLabel: UILabel!
    @IBOutlet var courseBookmarkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
