//
//  MycourseListCVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/12.
//

import UIKit

class MycourseListCVC: UICollectionViewCell {
    static let identifier = "MycourseListCVC"
    
    @IBOutlet var backView: UIView!
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var courseDistanceLabel: UILabel!
    @IBOutlet var courseTimeLabel: UILabel!
    @IBOutlet var buttonStackView: UIStackView!
    @IBOutlet var hashTagButtons: [UIButton]!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}

// MARK: - UI
extension MycourseListCVC {
    private func setUI() {
        setBackView()
        setLabel()
        setButton()
        //setStackView()
    }
    
    func setBackView() {
        backView.backgroundColor = .bookmarkBlue
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 10
        
        layer.masksToBounds = false
    }
    
    func setLabel() {
        courseNameLabel.text = "북악산 워킹 코스"
        courseDistanceLabel.text = "2km"
        courseTimeLabel.text = "1시간 30분"
    }
    
    func setButton() {
        let hashTags: [String] = ["#등산코스지", "#안힘들더라"]
        let colors: [UIColor] = [.bookmarkLightBlue, .popularYellow]
        var index = 0
        
        for button in hashTagButtons {
            button.layer.cornerRadius = 5
            
            button.setTitle(hashTags[index], for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 7, weight: .medium)
            button.backgroundColor = colors[index]
            button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
            button.setTitleColor(.black, for: .normal)
            button.isUserInteractionEnabled = false
            index += 1
        }
    }
}
