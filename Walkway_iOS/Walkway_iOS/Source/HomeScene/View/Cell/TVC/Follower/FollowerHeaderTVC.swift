//
//  FollowerHeaderTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/03.
//

import UIKit

class FollowerHeaderTVC: UITableViewCell {
    static let identifier = "FollowerHeaderTVC"
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followingTitleLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var courseTitleLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var followerTitleLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    
    var isFollowing =  false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - UI
extension FollowerHeaderTVC {
    private func setUI() {
        setView()
        setImageView()
        setLabel()
        setButton()
    }
    
    private func setView() {
        self.backgroundColor = .bookmarkDarkBlue
        bottomView.backgroundColor = .gray40
    }
    
    private func setImageView() {
        profileImage.layer.cornerRadius = 45
        profileImage.layer.masksToBounds = false
        profileImage.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        profileImage.layer.shadowOpacity = 1.0
        profileImage.layer.shadowOffset = CGSize(width: 2, height: 3)
        profileImage.layer.shadowRadius = 2
    }
    
    private func setLabel() {
        nameLabel.font = .boldSystemFont(ofSize: 15)
        
        followingTitleLabel.text = "팔로잉"
        followingTitleLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        
        followingLabel.text = "17"
        followingLabel.font = .boldSystemFont(ofSize: 20)
        
        courseTitleLabel.text = "코스"
        courseTitleLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        
        courseLabel.text = "9"
        courseLabel.font = .boldSystemFont(ofSize: 20)
        
        followerTitleLabel.text = "팔로워"
        followerTitleLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        
        followerLabel.text = "132"
        followerLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    private func setButton() {
        followButton.titleLabel?.font = .systemFont(ofSize: 11, weight: .semibold)
        followButton.layer.cornerRadius = 10
        followButton.contentEdgeInsets = UIEdgeInsets(top: 3, left: 12, bottom: 3, right: 12)
        followButton.addTarget(self, action: #selector(touchUpFollow), for: .touchUpInside)
        followSetting()
    }
    
    private func followSetting() {
        if isFollowing {
            followButton.setTitle("언팔로우", for: .normal)
            followButton.backgroundColor = .gray50
            followButton.setTitleColor(.bookmarkBlue, for: .normal)
        } else {
            followButton.setTitle("팔로우", for: .normal)
            followButton.backgroundColor = .latestBlue
            followButton.setTitleColor(.gray70, for: .normal)
        }
    }
}

// MARK: - Action
extension FollowerHeaderTVC {
    @objc func touchUpFollow() {
        if isFollowing {
            isFollowing = false
            followSetting()
        } else {
            isFollowing = true
            followSetting()
        }
    }
}

// MARK: - Data
extension FollowerHeaderTVC {
    func setName(name: String) {
        nameLabel.text = name
    }
}
