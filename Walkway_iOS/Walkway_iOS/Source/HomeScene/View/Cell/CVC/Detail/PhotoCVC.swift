//
//  PhotoCVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/26.
//

import UIKit

class PhotoCVC: UICollectionViewCell {
    static let identifier = "PhotoCVC"

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setImage(image: String) {
        imageView.image = UIImage(named: image)
    }
}

