//
//  LatestCourseTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/23.
//

import UIKit

class LatestCourseTVC: UITableViewCell {
    static let identifier = "LatestCourseTVC"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var bookmarkButton: UIButton!
    
    var isBookmarked = false
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
extension LatestCourseTVC {
    private func setUI() {
        setLabel()
        setImage()
        setButton()
    }
    
    private func setLabel() {
        titleLabel.font = .boldSystemFont(ofSize: 16)
        distanceLabel.font = .systemFont(ofSize: 13, weight: .medium)
        timeLabel.font = .systemFont(ofSize: 13, weight: .medium)
    }
    
    private func setImage() {
        courseImage.layer.cornerRadius = 10
    }
    
    private func setButton() {
        bookmarkButton.setTitle("", for: .normal)
        bookmarkButton.tintColor = .latestBlue
        bookmarkButton.addTarget(self, action: #selector(touchUpBookmark), for: .touchUpInside)
    }
}

// MARK: - Action
extension LatestCourseTVC {
    @objc func touchUpBookmark() {
        if isBookmarked {
            bookmarkDisable()
        } else {
            bookmarkEnable()
        }
    }
}

// MARK: - Data
extension LatestCourseTVC {
    func setCellData(rank: Int, course: Course) {
        titleLabel.text =  course.title
        distanceLabel.text = "\(course.distance)km"
        timeLabel.text = course.time
        
        if course.isBookmark {
            bookmarkEnable()
        } else {
            bookmarkDisable()
        }
        
        if isHashtaged == false {
            setHashtagButtons(buttons: course.hashtag ?? [])
            isHashtaged = true
        }
    }
    
    private func bookmarkEnable() {
        isBookmarked = true
        bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
    }
    
    private func bookmarkDisable() {
        isBookmarked = false
        bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
    }
    
    private func setHashtagButtons(buttons: [String]) {
        let colors: [UIColor] = [.latestBurgundy, .latestBlue, .latestBrownRed, .bookmarkDarkBlue, .bookmarkLightBlue]
        var index = 0
        
        if !(buttons.isEmpty) {
            let stackView = UIStackView()
            
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.spacing = 5
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            self.addSubview(stackView)
            stackView.topAnchor.constraint(equalTo: distanceLabel.bottomAnchor, constant: 10).isActive = true
            stackView.leadingAnchor.constraint(equalTo: courseImage.trailingAnchor, constant: 14).isActive = true
            stackView.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, constant: -self.frame.size.width/3).isActive = true
            
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
    }
}
