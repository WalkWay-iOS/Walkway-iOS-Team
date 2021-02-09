//
//  MyPageHeaderTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/10.
//

import UIKit

class MyPageHeaderTVC: UITableViewCell {
    static let identifier = "MyPageHeaderTVC"
    
    @IBOutlet var myPageTitleLabel: UILabel!
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var settingButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setText()
        setButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setText() {
        myPageTitleLabel.text = "마이 페이지"
    }
    
    func setButton() {
        settingButton.setImage(UIImage(systemName: "gearshape"), for: .normal)
    }
}
