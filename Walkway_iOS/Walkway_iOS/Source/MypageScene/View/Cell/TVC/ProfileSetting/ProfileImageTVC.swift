//
//  ProfileImageTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/07.
//

import UIKit

class ProfileImageTVC: UITableViewCell {
    static let identifier = "ProfileImageTVC"
    
    @IBOutlet var profileImageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setUI() {
        profileImageButton.layer.cornerRadius = profileImageButton.layer.frame.size.width/2
    }
}
