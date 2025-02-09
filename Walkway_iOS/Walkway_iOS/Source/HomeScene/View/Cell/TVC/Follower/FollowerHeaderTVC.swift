//
//  FollowerHeaderTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/03.
//

import UIKit
import Moya

class FollowerHeaderTVC: UITableViewCell {
    static let identifier = "FollowerHeaderTVC"
    
    private let authProvider = MoyaProvider<FollowerServices>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
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
    
    var followerUserId: String?
    
    var isFollowing: Bool?
    var followingNumber = 0
    
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
        followingTitleLabel.font = .myMediumSystemFont(ofSize: 13)
        
        followingLabel.font = .myBoldSystemFont(ofSize: 20)
        
        courseTitleLabel.text = "코스"
        courseTitleLabel.font = .myMediumSystemFont(ofSize: 13)
        
        courseLabel.font = .myBoldSystemFont(ofSize: 20)
        
        followerTitleLabel.text = "팔로워"
        followerTitleLabel.font = .myMediumSystemFont(ofSize: 13)
        
        followerLabel.font = .myBoldSystemFont(ofSize: 20)
    }
    
    private func setButton() {
        followButton.titleLabel?.font = .myMediumSystemFont(ofSize: 11)
        followButton.layer.cornerRadius = 10
        followButton.contentEdgeInsets = UIEdgeInsets(top: 3, left: 12, bottom: 3, right: 12)
        followButton.addTarget(self, action: #selector(touchUpFollow), for: .touchUpInside)
        followSetting()
    }
    
    private func followSetting() {
        if isFollowing ?? false {
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
        if isFollowing ?? false {
            isFollowing = false
            unfollow()
            followSetting()
            followingNumber -= 1
            followerLabel.text = "\(followingNumber)"
        } else {
            isFollowing = true
            follow()
            followSetting()
            followingNumber += 1
            followerLabel.text = "\(followingNumber)"
        }
    }
}

// MARK: - Data
extension FollowerHeaderTVC {
    func setData(follower: Follower, courseNum: Int, isFollowing: Bool) {
        nameLabel.text = follower.name
        followingLabel.text = "\(follower.followingNumber)"
        courseLabel.text = "\(courseNum)"
        followerLabel.text = "\(follower.followerNumber)"
        followingNumber = follower.followingNumber
        
        self.isFollowing = isFollowing
        followSetting()
    }
}

// MARK: Network
extension FollowerHeaderTVC {
    func follow() {
        authProvider.request(.follow(self.followerUserId ?? "")) { response in
            switch response {
                case .success(let result):
                    do {
                        print(result)
                    } catch(let err) {
                        print(err.localizedDescription)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
            }
        }
    }
    
    func unfollow() {
        authProvider.request(.unfollow(self.followerUserId ?? "")) { response in
            switch response {
                case .success(let result):
                    do {
                        print(result)
                    } catch(let err) {
                        print(err.localizedDescription)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
            }
        }
    }
}
