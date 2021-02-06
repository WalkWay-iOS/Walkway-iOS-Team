//
//  NotificationInfoTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/06.
//

import UIKit

class NotificationInfoTVC: UITableViewCell {
    static let identifier = "NotificationInfoTVC"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var followTitleLabel: UILabel!
    @IBOutlet var bookmarkTitleLabel: UILabel!
    @IBOutlet var rewardTitleLabel: UILabel!
    @IBOutlet var messageTitleLabel: UILabel!
    @IBOutlet var landmarkTitleLabel: UILabel!
    @IBOutlet var followAllowLabel: UILabel!
    @IBOutlet var followDisallowLabel: UILabel!
    @IBOutlet var bookmarkAllowLabel: UILabel!
    @IBOutlet var bookmarkDisallowLabel: UILabel!
    @IBOutlet var rewardAllowLabel: UILabel!
    @IBOutlet var rewardDisallowLabel: UILabel!
    @IBOutlet var messageAllowLabel: UILabel!
    @IBOutlet var messageDisallowLabel: UILabel!
    @IBOutlet var landmarkAllowLabel: UILabel!
    @IBOutlet var landmarkDisallowLabel: UILabel!
    
    @IBOutlet var outButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setText()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setText() {
        titleLabel.text = "알림"
        followTitleLabel.text = "팔로우"
        bookmarkTitleLabel.text = "북마크"
        rewardTitleLabel.text = "리워드"
        messageTitleLabel.text = "쪽지"
        landmarkTitleLabel.text = "랜드마크"
        
        followAllowLabel.text = "동의"
        bookmarkAllowLabel.text = "동의"
        rewardAllowLabel.text = "동의"
        messageAllowLabel.text = "동의"
        landmarkAllowLabel.text = "동의"
        
        followDisallowLabel.text = "비동의"
        bookmarkDisallowLabel.text = "비동의"
        rewardDisallowLabel.text = "비동의"
        messageDisallowLabel.text = "비동의"
        landmarkDisallowLabel.text = "비동의"
        
        outButton.setTitle("회원 탈퇴", for: .normal)
    }
}
