//
//  CourseWalkingHotPlaceCVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/17.
//

import UIKit

class CourseWalkingHotPlaceCVC: UICollectionViewCell {
    static let identifier = "CourseWalkingHotPlaceCVC"
    
    @IBOutlet var hotplaceImageView: UIImageView!
    @IBOutlet var hotplaceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setData(hotplace: String) {
        hotplaceLabel.text = hotplace
    }
}

// MARK: - UI
extension CourseWalkingHotPlaceCVC {
    func setUI() {
        setLabel()
    }
    
    func setLabel() {
        hotplaceLabel.font = .systemFont(ofSize: 10, weight: .bold)
        hotplaceLabel.textColor = .black
    }
}
