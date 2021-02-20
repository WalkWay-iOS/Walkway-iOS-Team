//
//  MyProfileTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/10.
//

import UIKit

class MyProfileTVC: UITableViewCell {
    static let identifier = "MyProfileTVC"
    
    @IBOutlet var hashTag1Label: UILabel!
    @IBOutlet var hashTag2Label: UILabel!
    @IBOutlet var hashTag3Label: UILabel!
    @IBOutlet var hashTag4Label: UILabel!
    @IBOutlet var myProfileButton: UIButton!
    @IBOutlet var followingTitleLabel: UILabel!
    @IBOutlet var myCourseTitleLabel: UILabel!
    @IBOutlet var followerTitleLabel: UILabel!
    @IBOutlet var followingNumLabel: UILabel!
    @IBOutlet var myCourseNumLabel: UILabel!
    @IBOutlet var followerNumLabel: UILabel!
    
    var delegate: myPagePresentDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - UI
extension MyProfileTVC {
    func setUI() {
        setLabel()
        setButton()
    }
    
    func setLabel() {
        hashTag1Label.backgroundColor = .bookmarkDarkBlue
        hashTag1Label.font = .myMediumSystemFont(ofSize: 12)
        hashTag1Label.textColor = .white
        hashTag1Label.layer.masksToBounds = true
        hashTag1Label.layer.cornerRadius = 12
        
        hashTag2Label.backgroundColor = .bookmarkDarkBlue
        hashTag2Label.font = .myMediumSystemFont(ofSize: 12)
        hashTag2Label.textColor = .white
        hashTag2Label.layer.masksToBounds = true
        hashTag2Label.layer.cornerRadius = 12
        
        hashTag3Label.backgroundColor = .bookmarkDarkBlue
        hashTag3Label.font = .myMediumSystemFont(ofSize: 12)
        hashTag3Label.textColor = .white
        hashTag3Label.layer.masksToBounds = true
        hashTag3Label.layer.cornerRadius = 12
        
        hashTag4Label.backgroundColor = .bookmarkDarkBlue
        hashTag4Label.font = .myMediumSystemFont(ofSize: 12)
        hashTag4Label.textColor = .white
        hashTag4Label.layer.masksToBounds = true
        hashTag4Label.layer.cornerRadius = 12
        
        hashTag1Label.text = "#스포츠"
        hashTag2Label.text = "#야경"
        hashTag3Label.text = "#등산"
        hashTag4Label.text = "#데이트코스"
        
        followerTitleLabel.font = .myMediumSystemFont(ofSize: 13)
        myCourseTitleLabel.font = .myMediumSystemFont(ofSize: 13)
        followingTitleLabel.font = .myMediumSystemFont(ofSize: 13)
        
        followerNumLabel.font = .myBoldSystemFont(ofSize: 20)
        myCourseNumLabel.font = .myBoldSystemFont(ofSize: 20)
        followingNumLabel.font = .myBoldSystemFont(ofSize: 20)
        
        followingTitleLabel.text = "팔로잉"
        myCourseTitleLabel.text = "나의 코스"
        followerTitleLabel.text = "팔로워"
        followingNumLabel.text = "10"
        myCourseNumLabel.text = "5"
        followerNumLabel.text = "10"
    }
    
    func setButton() {
        myProfileButton.setTitle("나", for: .normal)
        myProfileButton.titleLabel?.font = .myBoldSystemFont(ofSize: 23)
        myProfileButton.layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        myProfileButton.layer.shadowOpacity = 1.0
        myProfileButton.layer.shadowOffset = CGSize(width: 2, height: 3)
        myProfileButton.layer.shadowRadius = 2
        myProfileButton.layer.cornerRadius = myProfileButton.layer.frame.size.width/2
        myProfileButton.addTarget(self, action: #selector(touchUpProfileSetting), for: .touchUpInside)
    }
}

// MARK: - Action
extension MyProfileTVC {
    @objc func touchUpProfileSetting() {
        delegate?.cellTapedProfileSetting()
    }
}
