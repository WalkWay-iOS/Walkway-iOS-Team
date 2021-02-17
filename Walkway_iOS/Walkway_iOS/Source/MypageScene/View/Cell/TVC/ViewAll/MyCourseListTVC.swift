//
//  MyCourseListTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/14.
//

import UIKit

class MyCourseListTVC: UITableViewCell {
    static let identifier = "MyCourseListTVC"
    
    @IBOutlet var courseImageView: UIImageView!
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var courseDistanceLabel: UILabel!
    @IBOutlet var courseTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(course: String, distance: String, time: String) {
        courseNameLabel.text = course
        courseDistanceLabel.text = distance
        courseTimeLabel.text = time
    }
}

// MARK: - UI
extension MyCourseListTVC {
    func setUI() {
        setImage()
    }
    
    func setImage() {
        courseImageView.backgroundColor = .systemIndigo
    }
}
