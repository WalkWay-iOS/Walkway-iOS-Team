//
//  DetailHeaderTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/24.
//

import UIKit

class DetailHeaderTVC: UITableViewCell {
    static let identifier = "DetailHeaderTVC"

    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var courseStrengthLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var courseRateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var strengthProgressBar: UIProgressView!
    @IBOutlet weak var rateProgressBar: UIProgressView!
    
    var isHashtaged = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - UI
extension DetailHeaderTVC {
    private func setUI() {
        setImage()
        setLabel()
        setProgressBar()
        setView()
    }
    
    private func setImage() {
        courseImage.layer.masksToBounds = false
        courseImage.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        courseImage.layer.shadowOpacity = 0.8
        courseImage.layer.shadowOffset = CGSize(width: 0, height: 3)
        courseImage.layer.shadowRadius = 2
    }
    
    private func setLabel() {
        titleLabel.font = .boldSystemFont(ofSize: 26)
        
        distanceLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        distanceLabel.textColor = .gray50
        
        timeLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        timeLabel.textColor = .gray50
        
        courseStrengthLabel.text = "코스 강도"
        courseStrengthLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        courseStrengthLabel.textColor = .gray50
        
        courseRateLabel.text = "코스 평점"
        courseRateLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        courseRateLabel.textColor = .gray50
        
        strengthLabel.text = "🔥10/100"
        strengthLabel.font = .systemFont(ofSize: 11, weight: .semibold)
        
        rateLabel.text = "⭐️4.89/5.0"
        rateLabel.font = .systemFont(ofSize: 11, weight: .semibold)
    }
    
    private func setProgressBar() {
        strengthProgressBar.progress = 10/100
        strengthProgressBar.transform = strengthProgressBar.transform.scaledBy(x: 1, y: 2)
        strengthProgressBar.layer.masksToBounds = true
        strengthProgressBar.layer.cornerRadius = 3
        strengthProgressBar.tintColor = .bookmarkDarkBlue
        
        rateProgressBar.progress = 4.89/5.0
        rateProgressBar.transform = rateProgressBar.transform.scaledBy(x: 1, y: 2)
        rateProgressBar.layer.masksToBounds = true
        rateProgressBar.layer.cornerRadius = 3
        rateProgressBar.tintColor = .bookmarkDarkBlue
    }
    
    private func setView() {
        bottomView.backgroundColor = .gray50
    }
}

// MARK: - Data
extension DetailHeaderTVC {
    func setCellData(title: String, time: String, distance: String, hashtags: [String], isHome: Bool) {
        titleLabel.text = title
        
        if isHome {
            timeLabel.text = time
            distanceLabel.text = distance
        } else {
            timeLabel.text = "시간 \(time)"
            distanceLabel.text = "거리 \(distance)km"
        }
        
        if isHashtaged == false {
            setHashtagButtons(buttons: hashtags)
            isHashtaged = true
        }
    }
    
    private func setHashtagButtons(buttons: [String]) {
        var buttonTextCount = 0
        
        if !(buttons.isEmpty) {
            for btn in buttons[0...4] {
                buttonTextCount += btn.count
            }
            
            if buttonTextCount > 23 {
                setTwoLineHashtag(buttons: buttons, min: 4)
            } else if buttonTextCount > 16 {
                setTwoLineHashtag(buttons: buttons, min: 5)
            } else {
                setOneLineHashtag(buttons: buttons)
            }
        }
    }
    
    private func setOneLineHashtag(buttons: [String]) {
        let colors: [UIColor] = [.bookmarkBlue, .bookmarkDarkBlue, .bookmarkLightBlue, .bookmarkDarkBlue, .bookmarkLightBlue, .bookmarkBlue, .bookmarkDarkBlue]
        var index = 0
        
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: distanceLabel.bottomAnchor, constant: 30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        
        for btn in buttons {
            let button = UIButton()
            
            button.layer.cornerRadius = 8
            button.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
            button.layer.shadowOpacity = 0.8
            button.layer.shadowOffset = CGSize(width: 1, height: 2)
            button.layer.shadowRadius = 2
            
            button.backgroundColor = colors[index]
            button.setTitle(btn, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 10)
            button.setTitleColor(.white, for: .normal)
            button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
            button.isUserInteractionEnabled = false
            index += 1
            
            stackView.addArrangedSubview(button)
        }
    }
    
    private func setTwoLineHashtag(buttons: [String], min: Int) {
        let colors: [UIColor] = [.bookmarkBlue, .bookmarkDarkBlue, .bookmarkLightBlue, .bookmarkDarkBlue, .bookmarkLightBlue, .bookmarkBlue, .bookmarkDarkBlue]
        var index = 0
        
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: distanceLabel.bottomAnchor, constant: 25).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        
        let bottomStackView = UIStackView()
        
        bottomStackView.axis = .horizontal
        bottomStackView.alignment = .fill
        bottomStackView.spacing = 5
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(bottomStackView)
        bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5).isActive = true
        bottomStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        
        for btn in buttons[0...min] {
            let button = UIButton()
            
            button.layer.cornerRadius = 8
            button.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
            button.layer.shadowOpacity = 0.8
            button.layer.shadowOffset = CGSize(width: 1, height: 2)
            button.layer.shadowRadius = 2
            
            button.backgroundColor = colors[index]
            button.setTitle(btn, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 10)
            button.setTitleColor(.white, for: .normal)
            button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
            button.isUserInteractionEnabled = false
            index += 1
            
            stackView.addArrangedSubview(button)
        }
        
        let nextMin = min + 1
        for btn in buttons[nextMin...] {
            let button = UIButton()
            
            button.layer.cornerRadius = 8
            button.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
            button.layer.shadowOpacity = 0.8
            button.layer.shadowOffset = CGSize(width: 1, height: 2)
            button.layer.shadowRadius = 2
            
            button.backgroundColor = colors[index]
            button.setTitle(btn, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 10)
            button.setTitleColor(.white, for: .normal)
            button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
            button.isUserInteractionEnabled = false
            index += 1
            
            bottomStackView.addArrangedSubview(button)
        }
    }
}