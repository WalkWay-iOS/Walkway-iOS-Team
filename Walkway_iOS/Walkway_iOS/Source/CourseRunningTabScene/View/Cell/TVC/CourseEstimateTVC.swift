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
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func setUpStrengthValue(_ sender: UISlider) {
        let currentValue = String(format: "%.1f", Float(sender.value))
        strengthLabel.text = "\(currentValue)"
    }
    
    @IBAction func setUpRateValue(_ sender: UISlider) {
        let currentValue = String(format: "%.1f", Float(sender.value))
        rateLabel.text = "\(currentValue)"
    }
    
}

// MARK: - UI
extension CourseEstimateTVC {
    func setUI() {
        setSlider()
        setLabel()
    }
    
    func setLabel() {
        courseStrengthTitleLabel.font = .myBoldSystemFont(ofSize: 13)
        courseStrengthTitleLabel.textColor = .bookmarkDarkBlue
        courseStrengthTitleLabel.text = "코스 강도"
        
        courseRateTitleLabel.font = .myBoldSystemFont(ofSize: 13)
        courseRateTitleLabel.textColor = .bookmarkDarkBlue
        courseRateTitleLabel.text = "코스 평점"
        
        strengthLabel.font = .myBoldSystemFont(ofSize: 13)
        strengthLabel.textColor = .gray60
        strengthLabel.text = "\(strengthSlider.value)"
        
        rateLabel.font = .myBoldSystemFont(ofSize: 13)
        rateLabel.textColor = .gray60
        rateLabel.text = "\(rateSlider.value)"
    }
    
    func setSlider() {
        strengthSlider.tintColor = .bookmarkDarkBlue
        strengthSlider.value = 2.5
        
        rateSlider.tintColor = .bookmarkDarkBlue
        rateSlider.value = 2.5
    }
}
