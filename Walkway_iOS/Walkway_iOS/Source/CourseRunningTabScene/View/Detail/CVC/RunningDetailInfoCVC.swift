//
//  RunningDetailInfoCVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/01/31.
//

import UIKit

class RunningDetailInfoCVC: UICollectionViewCell {

    static let identifier = "RunningDetailInfoCVC"
    
    @IBOutlet var walkingDistanceLabel: UILabel!
    @IBOutlet var walkingRemainDistanceLabel: UILabel!
    @IBOutlet var walkingTimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setLabel() {
    }

}
