//
//  HomeBookmarkCourseCVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/22.
//

import UIKit

class HomeBookmarkCourseCVC: UICollectionViewCell {
    static let identifier = "HomeBookmarkCourseCVC"

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet var hashtagButtons: [UIButton]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
