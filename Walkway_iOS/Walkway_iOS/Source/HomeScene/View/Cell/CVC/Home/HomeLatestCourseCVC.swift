//
//  HomeLatestCourseCVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/22.
//

import UIKit

class HomeLatestCourseCVC: UICollectionViewCell {
    static let identifier = "HomeLatestCourseCVC"
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet var hashtagButtons: [UIButton]!
    
    var hashtag: [Hashtag] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}

// MARK: - UI
extension HomeLatestCourseCVC {
    private func setUI() {
        setBackground()
        setLabel()
        setStackView()
    }
    
    private func setBackground() {
        backView.backgroundColor = .latestDarkBrownRed
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 10
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize(width: 1, height: 2)
        layer.shadowRadius = 3
    }
    
    private func setLabel() {
        titleLabel.font = .myBoldSystemFont(ofSize: 15)
        titleLabel.textColor = .white
        titleLabel.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, constant: -self.frame.size.width/4.1).isActive = true

        timeLabel.font = .myRegularSystemFont(ofSize: 11)
        timeLabel.textColor = .white
        
        distanceLabel.font = .myRegularSystemFont(ofSize: 11)
        distanceLabel.textColor = .white
    }
    
    private func setButtons() {
        let colors: [UIColor] = [.latestBurgundy, .latestBlue, .latestBrownRed]
        var index = 0
        
        print("hashtag 들어와라 \(hashtag)")
        if !hashtag.isEmpty {
            
            for btn in hashtagButtons {
                btn.layer.cornerRadius = 11
                btn.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
                btn.layer.shadowOpacity = 0.8
                btn.layer.shadowOffset = CGSize(width: 1, height: 2)
                btn.layer.shadowRadius = 2
                
                btn.setTitle("#\(hashtag[index].keyword)", for: .normal)
                btn.titleLabel?.font = .myMediumSystemFont(ofSize: 12)
                btn.backgroundColor = colors[index]
                btn.contentEdgeInsets = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
                btn.setTitleColor(.white, for: .normal)
                btn.isUserInteractionEnabled = false
                index += 1
            }
        }
        index = 0
    }
    
    private func setStackView() {
        buttonStackView.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, constant: -20).isActive = true
    }
}

extension HomeLatestCourseCVC {
    func getData(course: Course) {
        titleLabel.text = course.title
        timeLabel.text = course.time
        distanceLabel.text = "\(course.distance)km"
        
        hashtag.append(contentsOf: course.hashtag)
        setButtons()
    }
}
