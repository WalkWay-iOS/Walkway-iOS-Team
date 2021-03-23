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
    
    var currentS: Double = 2.5
    var currentR: Double = 2.5
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        setNotification()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func setUpStrengthValue(_ sender: UISlider) {
        let currentValueS = String(format: "%.1f", Float(sender.value))
        currentS = Double(sender.value)
        strengthLabel.text = "\(currentValueS)"
    }
    
    @IBAction func setUpRateValue(_ sender: UISlider) {
        let currentValueR = String(format: "%.1f", Float(sender.value))
        currentR = Double(sender.value)
        rateLabel.text = "\(currentValueR)"
    }
    
}

// MARK: Notification
extension CourseEstimateTVC {
    private func setNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(saveAction), name: NSNotification.Name("recordSave"), object: nil)
    }
    
    @objc func saveAction() {
        let userDefault = UserDefaults.standard
        let cs = round(currentS * 10) / 10
        let cr = round(currentR * 10) / 10
        
        userDefault.set(cs, forKey: "strength")
        userDefault.set(cr, forKey: "rate")
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
