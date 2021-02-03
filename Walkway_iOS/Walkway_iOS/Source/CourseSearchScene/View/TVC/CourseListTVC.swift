//
//  CourseListTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/01/27.
//

import UIKit

class CourseListTVC: UITableViewCell {
    static let identifier = "CourseListTVC"
    
    var isBookmarkFill = false
    
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var courseDistanceLabel: UILabel!
    @IBOutlet var courseTimeLabel: UILabel!
    @IBOutlet var courseStarLabel: UILabel!
    @IBOutlet var courseBookmarkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        courseBookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func courseBookmarkOnOff(_ sender: UIButton) {
        if (isBookmarkFill == false) {
            isBookmarkFill = true
            courseBookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        }
        else {
            isBookmarkFill = false
            courseBookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
    }
    
    func setData(course: String, distance: String, time: String, rate: String) {
        courseNameLabel.text = course
        courseDistanceLabel.text = distance
        courseTimeLabel.text = time
        courseStarLabel.text = rate
        // courseTagLabel.text = tag
    }
}
