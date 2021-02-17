//
//  CourseWalkingMapCVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

class CourseWalkingMapCVC: UICollectionViewCell {
    static let identifier = "CourseWalkingMapCVC"
    
    @IBOutlet var pauseButton: UIButton!
    
    var delegate: walkingCoursePresentDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}

// MARK: - UI
extension CourseWalkingMapCVC {
    func setUI() {
        setButton()
    }
    
    func setButton() {
        pauseButton.setTitle("정지", for: .normal)
        pauseButton.setTitleColor(.white, for: .normal)
        pauseButton.backgroundColor = .systemIndigo
        pauseButton.layer.cornerRadius = 12
        pauseButton.addTarget(self, action: #selector(touchUpPause), for: .touchUpInside)
    }
}

// MARK: - Action
extension CourseWalkingMapCVC {
    @objc func touchUpPause() {
        delegate?.buttonTappedPause()
    }
}
