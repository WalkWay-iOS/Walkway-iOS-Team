//
//  CourseEstimateTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

class CourseEstimateTVC: UITableViewCell {
    static let identifier = "CourseEstimateTVC"
    
    @IBOutlet var courseStrengthTitleLabel: UILabel!
    @IBOutlet var courseStrengthProgress: UIProgressView!
    @IBOutlet var courseRateTitleLabel: UILabel!
    @IBOutlet var courseRateProgress: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - UI
extension CourseEstimateTVC {
    func setUI() {
        setLabel()
        setProgressView()
    }
    
    func setLabel() {
        courseStrengthTitleLabel.font = .systemFont(ofSize: 10, weight: .bold)
        courseStrengthTitleLabel.textColor = .systemIndigo
        courseStrengthTitleLabel.text = "코스 강도"
        courseRateTitleLabel.font = .systemFont(ofSize: 10, weight: .bold)
        courseRateTitleLabel.textColor = .systemIndigo
        courseRateTitleLabel.text = "코스 평점"
    }
    
    func setProgressView() {
        courseStrengthProgress.progress = 60 / 100
        courseStrengthProgress.transform = courseStrengthProgress.transform.scaledBy(x: 1, y: 4)
        courseStrengthProgress.layer.masksToBounds = true
        courseStrengthProgress.layer.cornerRadius = 3
        courseStrengthProgress.tintColor = .systemIndigo
        courseRateProgress.progress = 40 / 100
        courseRateProgress.transform = courseRateProgress.transform.scaledBy(x: 1, y: 4)
        courseRateProgress.layer.masksToBounds = true
        courseRateProgress.layer.cornerRadius = 3
        courseRateProgress.tintColor = .systemIndigo
    }
}
