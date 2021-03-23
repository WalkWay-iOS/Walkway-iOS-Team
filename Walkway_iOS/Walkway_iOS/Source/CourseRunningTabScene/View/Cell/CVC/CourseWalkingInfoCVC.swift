//
//  CourseWalkingInfoCVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

class CourseWalkingInfoCVC: UICollectionViewCell {
    static let identifier = "CourseWalkingInfoCVC"
    
    @IBOutlet var walkingCourseInfoTitleLabel: UILabel!
    @IBOutlet var walkingCourseInfoLabel: UILabel!
    
    @IBOutlet var landmarkInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}

// MARK: - UI
extension CourseWalkingInfoCVC {
    func setUI() {
        setLabel()
    }
    
    func setLabel() {
        walkingCourseInfoTitleLabel.font = .myBoldSystemFont(ofSize: 15)
        walkingCourseInfoTitleLabel.textColor = .bookmarkDarkBlue
        
        walkingCourseInfoLabel.font = .myRegularSystemFont(ofSize: 12)
        
        landmarkInfoLabel.font = .myBoldSystemFont(ofSize: 15)
        landmarkInfoLabel.textColor = .bookmarkDarkBlue
    }
    
    func setButton(tags: [String]) {
        let colors: [UIColor] = [.bookmarkBlue, .bookmarkDarkBlue, .bookmarkLightBlue, .bookmarkDarkBlue, .bookmarkLightBlue, .bookmarkBlue, .bookmarkDarkBlue]
        var index = 0
        
        
        if !tags.isEmpty {
            let stackView = UIStackView()
            
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.spacing = 5
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            self.addSubview(stackView)
            stackView.topAnchor.constraint(equalTo: landmarkInfoLabel.bottomAnchor, constant: 10).isActive = true
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
            
            for btn in tags {
                let button = UIButton()
                
                button.layer.cornerRadius = 8
                button.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
                button.layer.shadowOpacity = 0.8
                button.layer.shadowOffset = CGSize(width: 1, height: 2)
                button.layer.shadowRadius = 2
                
                button.backgroundColor = colors[index]
                button.setTitle("#\(btn)", for: .normal)
                button.titleLabel?.font = .boldSystemFont(ofSize: 13)
                button.setTitleColor(.white, for: .normal)
                button.contentEdgeInsets = UIEdgeInsets(top: 3, left: 10, bottom: 3, right: 10)
                button.isUserInteractionEnabled = false
                index += 1
                
                stackView.addArrangedSubview(button)
            }
        }
    }
    
    func setData(title: String, content: String, hashtags: [String]) {
        walkingCourseInfoTitleLabel.text = "[\(title)] 소개"
        walkingCourseInfoLabel.text = content
        landmarkInfoLabel.text = "[\(title)]의 랜드마크"
        
        setButton(tags: hashtags)
    }
}
