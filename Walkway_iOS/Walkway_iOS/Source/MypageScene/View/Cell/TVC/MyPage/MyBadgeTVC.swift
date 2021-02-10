//
//  MyBadgeTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/10.
//

import UIKit

class MyBadgeTVC: UITableViewCell {
    static let identifier = "MyBadgeTVC"
    
    @IBOutlet var myBadgeTitleLabel: UILabel!
    @IBOutlet var badgeAllButton: UIButton!
    @IBOutlet var myBadge1Button: UIButton!
    @IBOutlet var myBadge2Button: UIButton!
    @IBOutlet var myBadge3Button: UIButton!
    @IBOutlet var myBadge4Button: UIButton!
    
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
        myBadgeTitleLabel.text = "뱃지"
    }
    
    func setButton() {
        badgeAllButton.setTitle("전체보기", for: .normal)
        badgeAllButton.tintColor = .black
        myBadge1Button.backgroundColor = .systemIndigo
        myBadge1Button.tintColor = .white
        myBadge1Button.setImage(UIImage(systemName: "camera"), for: .normal)
        myBadge1Button.layer.cornerRadius = myBadge1Button.layer.frame.size.width/2
        myBadge2Button.backgroundColor = .systemIndigo
        myBadge2Button.tintColor = .white
        myBadge2Button.setImage(UIImage(systemName: "highlighter"), for: .normal)
        myBadge2Button.layer.cornerRadius = myBadge1Button.layer.frame.size.width/2
        myBadge3Button.backgroundColor = .systemIndigo
        myBadge3Button.tintColor = .white
        myBadge3Button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        myBadge3Button.layer.cornerRadius = myBadge1Button.layer.frame.size.width/2
        myBadge4Button.backgroundColor = .systemIndigo
        myBadge4Button.tintColor = .white
        myBadge4Button.setImage(UIImage(systemName: "flag"), for: .normal)
        myBadge4Button.layer.cornerRadius = myBadge1Button.layer.frame.size.width/2
    }
}
