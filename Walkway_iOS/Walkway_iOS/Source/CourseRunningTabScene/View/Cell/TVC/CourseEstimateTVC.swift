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
    @IBOutlet var courseRateTitleLabel: UILabel!
    @IBOutlet var strengthSlider: UISlider!
    @IBOutlet var rateSlider: UISlider!
    
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
        setSlider()
    }
    
    func setLabel() {
        courseStrengthTitleLabel.font = .systemFont(ofSize: 10, weight: .bold)
        courseStrengthTitleLabel.textColor = .systemIndigo
        courseStrengthTitleLabel.text = "코스 강도"
        courseRateTitleLabel.font = .systemFont(ofSize: 10, weight: .bold)
        courseRateTitleLabel.textColor = .systemIndigo
        courseRateTitleLabel.text = "코스 평점"
    }
    
    func setSlider() {
        strengthSlider.tintColor = .systemIndigo
        rateSlider.tintColor = .systemIndigo
    }
}
