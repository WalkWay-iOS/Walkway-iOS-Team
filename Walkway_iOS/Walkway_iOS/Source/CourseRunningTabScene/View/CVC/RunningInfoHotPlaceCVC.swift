//
//  RunningInfoHotPlaceCVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/03.
//

import UIKit

class RunningInfoHotPlaceCVC: UICollectionViewCell {
    @IBOutlet var hotPlaceImage: UIImageView!
    @IBOutlet var hotPlaceNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setImageLabel() {
        hotPlaceNameLabel.text = "서울숲"
    }
}
