//
//  ProfileInfoTVC.swift
//  Walkway_iOS
//
//  Created by jjuyaa on 2021/02/07.
//

import UIKit

class ProfileInfoTVC: UITableViewCell {
    static let identifier = "ProfileInfoTVC"
    
    @IBOutlet var idTitleLabel: UILabel!
    @IBOutlet var emailTitleLabel: UILabel!
    @IBOutlet var passwordTitleLabel: UILabel!
    @IBOutlet var userIDLabel: UILabel!
    @IBOutlet var userEmailLabel: UILabel!
    @IBOutlet var userEditEmailButton: UIButton!
    @IBOutlet var userEditPasswordButton: UIButton!
    
    var delegate: profilePresentDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - UI
extension ProfileInfoTVC {
    func setUI() {
        setLabel()
        setButton()
    }
    
    func setLabel() {
        setTitleLabel()
        setUserLabel()
    }
    
    func setButton() {
        userEditEmailButton.setTitle("", for: .normal)
        userEditEmailButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        userEditEmailButton.setTitleColor(.systemIndigo, for: .normal)
        userEditEmailButton.addTarget(self, action: #selector(touchUpEditEmail), for: .touchUpInside)
        userEditPasswordButton.setTitle("", for: .normal)
        userEditPasswordButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        userEditPasswordButton.setTitleColor(.systemIndigo, for: .normal)
        userEditPasswordButton.addTarget(self, action: #selector(touchUpEditPassword), for: .touchUpInside)
    }
    
    func setTitleLabel() {
        idTitleLabel.text = "아이디"
        emailTitleLabel.text = "이메일"
        passwordTitleLabel.text = "비밀번호"
    }
    
    func setUserLabel() {
        userIDLabel.text = "abcdefg"
        userEmailLabel.text = "abcdefg@gmail.com"
    }
}

// MARK: - Action
extension ProfileInfoTVC {
    @objc func touchUpEditEmail() {
        delegate?.cellTapedEditEmail()
    }
    
    @objc func touchUpEditPassword() {
        delegate?.cellTapedEditPassword()
    }
}
