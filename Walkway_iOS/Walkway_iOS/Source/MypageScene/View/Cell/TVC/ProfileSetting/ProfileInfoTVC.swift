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
        idTitleLabel.text = "아이디"
        emailTitleLabel.text = "이메일"
        passwordTitleLabel.text = "비밀번호"
        userIDLabel.text = "abcdefg"
        userEmailLabel.text = "abcdefg@gmail.com"
    }
    
    func setButton() {
        userEditEmailButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        userEditPasswordButton.setImage(UIImage(systemName: "pencil"), for: .normal)
    }
}
