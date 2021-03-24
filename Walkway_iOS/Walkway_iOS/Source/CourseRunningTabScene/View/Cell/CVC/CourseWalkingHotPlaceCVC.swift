//
//  CourseWalkingHotPlaceCVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

class CourseWalkingHotPlaceCVC: UICollectionViewCell {
    static let identifier = "CourseWalkingHotPlaceCVC"

    @IBOutlet var hotplaceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setData(hotplace: String) {
        hotplaceLabel.text = "#\(hotplace)"
    }
}

// MARK: - UI
extension CourseWalkingHotPlaceCVC {
    func setUI() {
        setLabel()
        setBack()
    }
    
    func setLabel() {
        hotplaceLabel.font = .myBoldSystemFont(ofSize: 13)
        hotplaceLabel.textColor = .white
    }
    
    func setBack() {
        self.backgroundColor = .bookmarkBlue
        self.layer.cornerRadius = 13
    }
}
