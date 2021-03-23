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
extension MyPageHeaderTVC {
    func setUI() {
        setLabel()
        setButton()
    }
    
    func setLabel() {
        myPageTitleLabel.text = "마이 페이지"
        myPageTitleLabel.font = .myBoldSystemFont(ofSize: 28)
    }
    
    func setButton() {
        settingButton.setImage(UIImage(systemName: "gearshape"), for: .normal)
        settingButton.tintColor = .bookmarkDarkBlue
        settingButton.addTarget(self, action: #selector(touchUpSetting), for: .touchUpInside)
    }
}

// MARK: - Action
extension MyPageHeaderTVC {
    @objc func touchUpSetting() {
        delegate?.cellTapedSetting()
    }
}
